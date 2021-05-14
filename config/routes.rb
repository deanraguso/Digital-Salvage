Rails.application.routes.draw do
  resources :addresses
  resources :items
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
