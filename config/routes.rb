Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :sounds, only: [:new, :create, :edit, :update, :destroy, :index]
  resources :styles, only: [:new, :create, :edit, :update, :destroy, :index]
  resources :boxes
end
