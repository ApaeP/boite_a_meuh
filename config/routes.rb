Rails.application.routes.draw do
  devise_for :users
  resources :boxes
  root to: 'pages#home'
end
