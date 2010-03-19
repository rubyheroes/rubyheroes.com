require 'test_helper'

class HeroesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Hero.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Hero.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Hero.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hero_url(assigns(:hero))
  end
  
  def test_edit
    get :edit, :id => Hero.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Hero.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Hero.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Hero.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Hero.first
    assert_redirected_to hero_url(assigns(:hero))
  end
  
  def test_destroy
    hero = Hero.first
    delete :destroy, :id => hero
    assert_redirected_to heroes_url
    assert !Hero.exists?(hero.id)
  end
end
