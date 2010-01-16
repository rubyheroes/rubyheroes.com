module RedHillConsulting::RowVersionMigrations::ActiveRecord
  module Migration
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def create_table(name, options = {})
        super do |table_defintion|
          yield table_defintion          
          if options[:row_version] || options[:id] != false
            table_defintion.datetime  :created_at,                  :null => false
            table_defintion.datetime  :updated_at,                  :null => false
            table_defintion.integer   :lock_version, :default => 0, :null => false
          end unless ActiveRecord::Schema.defining?
        end
      end
    end
  end
end
