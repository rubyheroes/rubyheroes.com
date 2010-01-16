module ActiveRecord #:nodoc:
  module AttributeMethods #:nodoc:
    # Cross Site Sniper (XSS)
    module ClassMethods #:nodoc:
      
      # Piggybacks onto the end of ActiveRecord's define_attribute_methods
      # to wrap and automatically html_escape string and text fields.
      def define_attribute_methods_with_html_escaping
        
        # Let ActiveRecord define it's methods first.
        define_attribute_methods_without_html_escaping
        
        #Bail outta here if we're in an STI subclass situation.
        #Primary class will get the magic methods.
        return unless descends_from_active_record?
        
        content_columns.each do |column|
          #Only escape string and text fields
          next unless [:string,:text].include?(column.type)
          
          #Only escape fields that had their methods generated automatically.
          #in order not to interfere if the class defined it's own method.
          next unless generated_methods.include?(column.name)
          
          #Skip fields designated as not escaped
          next if  @cross_site_sniper_excepted_fields and (@cross_site_sniper_excepted_fields.include?(column.name) or @cross_site_sniper_excepted_fields.include?(column.name.to_sym))
          
          #Skip fields designated as not escaped
          if @cross_site_sniper_only_fields
            next unless @cross_site_sniper_only_fields.include?(column.name) or @cross_site_sniper_only_fields.include?(column.name.to_sym)
          end
          
          define_method("#{column.name}_with_html_escaping") do
            
            # Retrieve the raw data.
            val = send("#{column.name}_without_html_escaping")
            
            # Only escape strings. Other data types, such
            # as 'nil', should be returned uncorrupted.
            val.is_a?(String) ? ERB::Util::h(val) : val
          end
          alias_method_chain column.name.to_sym, :html_escaping
          
          # Add newly generated methods to list just
          # in case we were called directly from
          # ActiveRecord::AttributeMethods::method_missing
          # and one of these is the missing method.
          generated_methods << "#{column.name}_with_html_escaping"
          generated_methods << "#{column.name}_without_html_escaping"
        end
        
      end
      alias_method_chain :define_attribute_methods, :html_escaping
    end
  end
  
  module CrossSiteSniperExtensions #:nodoc:
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      # This is an *optional* method to fine tune which string and text fields
      # to automatically escape. Without calling html_escape, all automatically
      # generated accessor methods tied to string and text fields in the database
      # will be automatically escaped.
      #
      # === Configuration Options:
      #
      # * +only+ - specifies a list of column names to escape.
      # * +except+ - specifies a list of column names to not escape.
      # * +none+ - disables automatic escaping for entire class.
      # * +all+ - (default) auto-escapes all fields. Same as not calling
      #   html_escape at all.
      #
      # === Examples
      #
      #   Class Snipe < ActiveRecord::Base
      #     html_escape :only => [:species, :genus]
      #   # *OR*
      #     html_escape :except => :description
      #   # *OR*
      #     html_escape :none
      #   # *OR*
      #     html_escape :all   #Same as not calling html_escape at all.
      #   end
      #
      def html_escape(opts = {})
        opts = {opts => true} unless opts.is_a?(Hash)
        opts.assert_valid_keys(:only,:except,:none,:all)
        class_eval do
          if opts[:except]
            @cross_site_sniper_excepted_fields = [opts[:except]].flatten
          elsif opts[:only]
            @cross_site_sniper_only_fields = [opts[:only]].flatten
          elsif opts[:none]
            @cross_site_sniper_only_fields = Array.new
          end
        end
      end
      
    end
  end
end
