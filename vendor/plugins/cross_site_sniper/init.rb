# Include hook code here
require 'cross_site_sniper'
ActiveRecord::Base.class_eval { include ActiveRecord::AttributeMethods::ClassMethods }
ActiveRecord::Base.class_eval { include ActiveRecord::CrossSiteSniperExtensions }