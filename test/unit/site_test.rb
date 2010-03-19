require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Site.new.valid?
  end
end
