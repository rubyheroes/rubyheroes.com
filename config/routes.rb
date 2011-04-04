RubyHeroAwards::Application.routes.draw do
  resources :heroes
  match 'heroes/year/:year' => 'heroes#year', :year => /\d{4}/
  
  resources :nominations, :new => {:new => [:post]}
  resources :sites do
    resources :nominations
    collection do
      get :search
    end
  end

  root :to => 'sites#search'
  
end
