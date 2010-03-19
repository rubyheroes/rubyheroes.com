require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Site.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Site.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Site.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to site_url(assigns(:site))
  end
  
  def test_edit
    get :edit, :id => Site.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Site.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Site.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Site.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Site.first
    assert_redirected_to site_url(assigns(:site))
  end
  
  def test_destroy
    site = Site.first
    delete :destroy, :id => site
    assert_redirected_to sites_url
    assert !Site.exists?(site.id)
  end
end
