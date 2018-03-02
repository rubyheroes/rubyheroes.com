RubyHeroAwards::Application.routes.draw do
  resources :nominations

  resources :heroes, only: [:index] do
    collection do
      get ":year", to: "heroes#year", as: :year
    end
  end

  resources :nominees, only: [:index]

  namespace :admin do
    resources :nominees, only: [:index, :show] do
      put :merge
    end
    resources :nominators, only: [:index, :show]
    root to: "nominees#index"
  end

  root "home#show"

  get "/nominate/:nominee", to: "nominations#new", as: :nominate
end
