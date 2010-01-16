module Factory
  
  def self.category_attributes
    { :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      :name         => "Category #{Time.now}" }
  end

  def self.nomination_attributes
    { :category_id      => create_category.id,
      :nominee          => "Trady Blix",
      :nominator_email  => "brandon.beacher@gmail.com",
      :nominator_name   => "Brandon Beacher",
      :site_name        => "why's (poignant) guide to ruby",
      :site_url         => "www.poignantguide.net",
      :testimonial      => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
  end
  
  def self.user_attributes
    max   = User.maximum(:id)
    max   = max.nil? ? 1 : max + 1
    { :name => "User#{max}",
      :email => "user#{max}@example.com",
      :openid_url => "user#{max}.example.com",
      :uploaded_data => ActionController::TestUploadedFile.new("public/images/brandon.jpg", "image/jpg") }
  end
  
  def self.create_category(attributes = {})
    Category.create! category_attributes.merge(attributes)
  end
  
  def self.create_nomination(attributes = {})
    Nomination.create! nomination_attributes.merge(attributes)
  end
  
  def self.create_user(attributes = {})
    User.create! user_attributes.merge(attributes)
  end
end