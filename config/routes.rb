Rails.application.routes.draw do
  get 'sweets/index'
  root to: "sweets#index"
end
