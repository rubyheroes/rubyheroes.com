require 'test_helper'

class NominatorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Nominator.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Nominator.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Nominator.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to nominator_url(assigns(:nominator))
  end
  
  def test_edit
    get :edit, :id => Nominator.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Nominator.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Nominator.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Nominator.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Nominator.first
    assert_redirected_to nominator_url(assigns(:nominator))
  end
  
  def test_destroy
    nominator = Nominator.first
    delete :destroy, :id => nominator
    assert_redirected_to nominators_url
    assert !Nominator.exists?(nominator.id)
  end
end
