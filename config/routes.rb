Rails.application.routes.draw do
  devise_for :users
  get 'sweets/index'
  root to: "sweets#index"

  resources :sweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  post 'like/:id' => 'likes#create', as: 'create_like'
end
