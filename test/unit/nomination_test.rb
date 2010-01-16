require File.dirname(__FILE__) + '/../test_helper'

class NominationTest < ActiveSupport::TestCase

  def test_should_save_site_subdomain_on_create
    n = Factory.create_nomination :site_url => "www.thewildwildrest.com"
    n.reload
    assert_equal n.site_subdomain, "thewildwildrest.com"
  end
  
  def test_should_save_site_subdomain_on_update
    n = Factory.create_nomination
    n.site_url = "www.thewildwildrest.com"
    assert n.save
    n.reload
    assert_equal n.site_subdomain, "thewildwildrest.com"
  end
  
end
