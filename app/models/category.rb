class Category < ActiveRecord::Base
  has_many :nominations
  has_many :votes
  
  validates_presence_of     :description, :name
  validates_uniqueness_of   :name, :case_sensitive => false
  
  attr_accessible :description, :name

  def self.search(options = {})
    options[:order]     ||= "name"
    options[:per_page]  ||= 15
    Category.find(:all, :order => options[:order]) do
      paginate :page => options[:page], :per_page => options[:per_page] unless options[:skip_pagination]
    end
  end

end
