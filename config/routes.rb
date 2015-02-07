RubyHeroAwards::Application.routes.draw do
  root "home#show"

  resources :nominations
  resources :heroes
  resources :nominees, only: %w( index )

  namespace :admin do
    resources :nominees, only: %w( index show )
    resources :nominators, only: %w( index show )
    root "nominees#index"
  end
end
