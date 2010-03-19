require 'test_helper'

class NominatorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Nominator.new.valid?
  end
end
