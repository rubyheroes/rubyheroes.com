# extensions to ActiveRecord::Base which are useful to models throughout our application
# locate this file as application_model.rb in lib and require it in environment.rb as such:
# require "application_model"
module ActiveRecord
  class RecordNotDestroyed < ActiveRecordError
  end
end

module ApplicationModel
  
  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end    
  end
  
  def destroy!
    destroy || raise(ActiveRecord::RecordNotDestroyed)
  end

  module ClassMethods
    
    def create_or_update(options = {})
      id = options.delete(:id)
      record = find_by_id(id) || new
      record.id = id
      record.attributes = options
      record.save!
      record
    end    

  end
  
end

class ActiveRecord::Base
  include ApplicationModel
end
