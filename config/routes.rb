Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:show, :edit]

  resources :targets do
    member do
      post "achieve"
    end
  end
  root to: "targets#index"
end
