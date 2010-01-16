require File.dirname(__FILE__) + '/../test_helper'

class MyMailerTest < ActionMailer::TestCase
  tests MyMailer
  def test_hero_notice
    @expected.subject = 'MyMailer#hero_notice'
    @expected.body    = read_fixture('hero_notice')
    @expected.date    = Time.now

    assert_equal @expected.encoded, MyMailer.create_hero_notice(@expected.date).encoded
  end

end
