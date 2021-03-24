Rails.application.routes.draw do
  get 'sounds/new'
  get 'sounds/edit'
  get 'sounds/index'
  devise_for :users
  resources :boxes
  root to: 'pages#home'
end
