Rails.application.routes.draw do
  devise_for :users
  get 'sweets/index'
  root to: "sweets#index"

  resources :sweets, only: [:index, :new, :create]
end
