Rails.application.routes.draw do
  resources :lists
  resources :labels
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:show]

  resources :targets do
    member do
      post "achieve"
    end
  end

  resources :labels do
    get "targets", to: "targets#search"
  end
  
  root to: "targets#index"
end
