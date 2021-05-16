Rails.application.routes.draw do
  resources :inboxes
  resources :addresses
  resources :items
  post 'inboxes/message_create/:id', to: 'inboxes#message_create', as: "inbox_message_create"
  get 'item/search(/:query)', to: "items#search", as: "item_search"
  devise_for :users, controllers: {
    registrations: "user/registrations"
  }
  root 'pages#index'
  get 'pages/index'

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
