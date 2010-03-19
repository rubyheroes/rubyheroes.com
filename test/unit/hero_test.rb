require 'test_helper'

class HeroTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Hero.new.valid?
  end
end
