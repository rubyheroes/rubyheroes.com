RubyHeroAwards::Application.routes.draw do

  root :to => 'home#show'
  resources :nominations

  resources :heroes
  
  resources :nominations
  resources :nominees, :only => %w( index )

end
