module RedHillConsulting::Stripper::ActiveRecord
  module Base
    def self.included(base)
      base.alias_method_chain :write_attribute, :stripper
    end

    def write_attribute_with_stripper(attr_name, value)
      value = value.strip if value.respond_to?(:strip)
      value = nil if value.respond_to?(:empty?) && value.empty?
      write_attribute_without_stripper(attr_name, value)
    end
  end
end
