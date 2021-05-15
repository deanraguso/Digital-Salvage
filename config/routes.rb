Rails.application.routes.draw do
  resources :addresses
  resources :items
  get 'item/search', to: "items#search"
  devise_for :users, controllers: {
    registrations: "user/registrations"
  }
  root 'pages#index'
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
