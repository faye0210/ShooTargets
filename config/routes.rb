Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:show, :edit]

  root to: "targets#index"
  resources :targets do
    member do
      post "achieve"
    end
  end
end
