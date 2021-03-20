Rails.application.routes.draw do
  devise_for :users
  get 'sweets/index'
  root to: "sweets#index"

  resources :sweets do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
