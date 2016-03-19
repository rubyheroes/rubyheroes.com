RubyHeroAwards::Application.routes.draw do
  get '/.well-known/acme-challenge/:id' => 'pages#lets_encrypt'

  resources :nominations
  resources :heroes, only: [:index] do
    collection do
      get ":year", to: "heroes#year"
    end
  end
  resources :nominees, only: [:index]

  namespace :admin do
    resources :nominees, only: [:index, :show]
    resources :nominators, only: [:index, :show]
    root to: "nominees#index"
  end

  root "home#show"
end
