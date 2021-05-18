Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:show, :new, :create]
end
