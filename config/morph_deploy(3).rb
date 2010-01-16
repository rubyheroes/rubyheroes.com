require 'fileutils'
require 'cgi'
require 'net/https'
require 'yaml'
require 'highline/import'
load 'deploy'

# The svn repository is used to export the code into the temporary directory before 
# uploading code into the Morph control panel. Currently only svn is supported, 
# but you could change it to fit your need by changing the get_code task
set :repository, 'http://rubyheroes.svn.beanstalkapp.com/rubyheroes/trunk' # Set here your repository! Example: 'https://dev.morphexchange.com/repos/ruby/trunk/control_panel/control_panel'
set :repo_line_number, __LINE__ - 1 # Needed to report missing repository later on

# The version name to set in the control panel. Defautls to date and time, but can be altered by passing it
# on the command line as -s version_name='The Version Name'
set :version_name, Time.now.utc.strftime('%Y-%m-%d %H:%M:%S')

# If you want to use a different scm or use a different export method, you can chane it here
# Please note that the export to directory is removed before the checkout starts. If
# You want it to work differently, change the code in the get_code task 
set :deploy_via, :export
set :scm, :subversion

# MORPH SETTINGS, please do not change
set :morph_host, "panel.morphexchange.com"
set :morph_port, 443
set :morph_tmp_dir, 'morph_tmp'
set :mex_key, "7b7846145f0e5c4769d97a367a6ac91d73feb5de"
set :rmdir_cmd, PLATFORM.include?('mswin') ? 'rmdir /s /q' : 'rm -rf'
set :mv_cmd, PLATFORM.include?('mswin') ? 'ren' : 'mv'
set :morph_tmp_dir, 'morph_tmp'
set :release_path, morph_tmp_dir # needed in order to generate the correct scm command 
set :get_code_using, :get_code


namespace :morph do

  # This is the entry point task. It gets the new code, then upload it into S3
  # to a special folder used later for deployment. Finally it mark the version 
  # Uploaded to be deployed
  task :deploy do
    transaction do
      update_code
 
      conn_start do |http| 
        r = Net::HTTP::Post.new('/api/deploy/deploy')
        add_mex_fields(r)
        r.add_field('Content-length', '0')
        response = http.request(r)
        puts response.body
          raise "Error - Could not deploy the application!" if !response.is_a?(Net::HTTPOK)
      end        
      say("Done.")        
    end
  end

  # Specialized command to deploy from a packaged gem
  task :deploy_from_gem do
    set :get_code_using, :get_code_from_gem 
    deploy
  end

  # This task calls the get_code helper, then upload the code into S3 
  task :update_code do
    transaction do
      abort('You need a MeX key!') if mex_key.nil?
        
      self.send get_code_using
      say("*** Getting info for Morph authentication ***")
      s3_data = ""
      
      #Authenticate
      is_auth = false
      loop do
        set(:morph_user, ask("Morph user: ")) if !exists?(:morph_user) || morph_user.nil?
        set(:morph_pass, ask("Password:  ") { |q| q.echo = false }) if !exists?(:morph_pass) || morph_pass.nil?
          
        #make a request to MorphCP to get S3 auth
        conn_start do |http|
          r = Net::HTTP::Get.new('/api/s3/connection_data')
          add_mex_fields(r)
          response = http.request(r)
          if !response.is_a?(Net::HTTPOK)
            say("Authentication failed! Please try again.")
            set :morph_user, nil
            set :morph_pass, nil
          else  
            s3_data = YAML.load(response.body)
            is_auth = true
          end
        end          
        break if is_auth
      end

      abort('****** ERROR: Authentication with MorpExchange failed!') if !is_auth  
      #connect to s3
      say("Uploading the code...")
      conn_start(s3_data[:host]) do |http|
        request = Net::HTTP::Put.new(s3_data[:path]) 
        s3_data[:header].each {|k,v| request.add_field(k,v)}
        #upload .tar file 
        raise "Error - Could not find archive to upload." unless File.exist?('code_update.tar.gz')
        request.content_length = File.stat('code_update.tar.gz').size
        File.open('code_update.tar.gz', 'rb') do |up_file|
          request.body_stream = up_file
          response = http.request(request)
          raise "Could not upload the code!" if !response.is_a?(Net::HTTPOK) && !response.is_a?(Net::HTTPSuccess)
        end
      end
      say("Creating new appspace version...")
      
      #create a version in CP
      conn_start do |http|
        r = Net::HTTP::Post.new('/versions/create2')
        add_mex_fields(r) 
        r.add_field('morph-version-name', version_name)
        r.add_field('morph-version-s3-object', s3_data[:obj_name])
        r.add_field('Content-length', '0')
        response = http.request(r)
        raise "Error - Could not create a new version!" if !response.is_a?(Net::HTTPOK)
      end        
      say("Done.")  

    end
  end

  # A task that create a temp dir, export the code ouf ot svn and tar
  # the code preparing it for upload.
  # If you are not using svn, or using a different source control tool
  # you can customize this file to work with it. The requirement is that
  # It will export the whole structure into the temp directory as set in
  # morph_tmp_dir.
  # 
  # You can choose to release a different version than head by setting the 
  # Environment variable 'REL_VER' to the version to use.
  task :get_code do
    on_rollback do
      system("#{rmdir_cmd} #{morph_tmp_dir} code_update.tar.gz")
    end
      
    # Make sure we have a repo to work from!
    abort("***ERROR: Must specify the repository to check out from! See line #{repo_line_number} in #{__FILE__}.") if !repository

    transaction do
      # Clean up previous deploys
      system("#{rmdir_cmd} #{morph_tmp_dir} code_update.tar.gz")

      #get latest code from from the repository 
      say("Downloading the code from the repository...")
      system(strategy.send(:command))
      raise('Export from repository failed! Please check the repository setting at the start of the file') if $?.to_i != 0

      # Verify that we have the expected rails structure 
      ['/app', '/public', '/config/environment.rb', '/lib'].each do |e| 
        raise "\n***ERROR: Rails directories are missing. Please make sure your set :repository is correct!\n" if !File.exist?("#{morph_tmp_dir}#{e}")
      end

      #create archive
      system("tar -C #{morph_tmp_dir} -czf code_update.tar.gz --exclude='./.*' .")
      raise('Failed to tar the file for upload.') if $?.to_i != 0
      
      # Verify that we have the expected rails structure in the archive
      flist = `tar -tzf code_update.tar.gz`
      all_in = flist.include?('lib/') && flist.include?('app/') && flist.include?('config/environment.rb')
      raise "\n***ERROR: code archive is missing the rails directories. Please check your checkout and tar\n" if !all_in

      system("#{rmdir_cmd} \"#{morph_tmp_dir}\"")        
    end
  end

  # Get the code from a packaged gem. Name comes from a setting passed to the command
  # using the -s form
  task :get_code_from_gem do
    # Make sure we have the gem defined and that we have the gem file
    if !exists?(:gem_file) || gem_file.nil?
      abort("***ERROR: The gem file must be provided on the command line using -s.\n          For example: cap -f morph_deploy.rb -s gem_file=/home/morph/my_app.gem morph:deploy_from_gem") 
    end

    abort("***ERROR: gem file not found! Please check the file location and try again") if !File.exists?(gem_file)

    # Remove older file
    system("#{rmdir_cmd} code_update.tar.gz") 

    # Extract the data.tar.gz code from the gem
    system("tar xf #{gem_file} data.tar.gz")
    abort("***ERROR: Couldn't fine the data.tar.gz file in the gem file provided!") if !File.exists?('data.tar.gz')

    # rename it to upload_code.tar.gz
    system("#{mv_cmd} data.tar.gz code_update.tar.gz")
  end

  # Helper to add the mex auth fields to the requests
  def add_mex_fields(req)
    req.add_field('morph-user', morph_user)
    req.add_field('morph-pass', morph_pass)
    req.add_field('morph-app',  mex_key)
  end

  # Helper to create a connection with all the needed setting
  # And yeals to the block
  def conn_start host = morph_host, port = morph_port
    con = Net::HTTP.new(host, port)
    con.use_ssl = true
    # If you have cert files to use, change this to OpenSSL::SSL::VERIFY_PEER
    # And set the ca_cert of the connection
    con.verify_mode = OpenSSL::SSL::VERIFY_NONE
    con.start
    if block_given?
      begin
        return yield(con)
      ensure
        con.finish
      end
    end
    con
  end

end

