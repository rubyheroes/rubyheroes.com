require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  fixtures :users

  def test_should_create_user
    assert_difference 'User.count' do
      user = Factory.create_user
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_email
    u = Factory.create_user
    u.email = nil
    assert !u.save
    assert u.errors.on(:email)
  end

  def test_should_require_openid_url
    u = Factory.create_user
    u.openid_url = nil
    assert !u.save
    assert u.errors.on(:openid_url)
  end

end
