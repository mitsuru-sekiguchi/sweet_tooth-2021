Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get 'sweets/index'
  root to: "sweets#index"

  post '/index/guest_sign_in', to: 'index#guest_sign_in'

  devise_scope :user do
    post 'user/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :sweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
