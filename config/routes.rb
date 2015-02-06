RubyHeroAwards::Application.routes.draw do
  root to: 'home#show'

  resources :nominations
  resources :heroes
  resources :nominees, only: %w( index )

  namespace :admin do
    resources :nominees, only: %w( index show )
    resources :nominators, only: %w( index show )
    root to: 'nominees#index'
  end
end
