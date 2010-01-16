require "action_controller/test_process"

User.create_or_update(
  :id => 1,
  :name => "Brandon Beacher",
  :email => 'brandon.beacher@gmail.com',
  :openid_url => 'thewildwildrest.com',
  :uploaded_data => ActionController::TestUploadedFile.new("public/images/brandon.jpg", "image/jpg"))