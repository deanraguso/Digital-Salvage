Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show/:id', to: "orders#show", as: "orders_show"
  get 'orders/new'
  get 'orders/create'

  resources :inboxes, except: [:edit, :update]
  post 'inboxes/message_create/:id', to: 'inboxes#message_create', as: "inbox_message_create"

  resources :addresses
  resources :items
  get 'item/search(/:query)', to: "items#search", as: "item_search"


  devise_for :users, controllers: {
    registrations: "user/registrations"
  }


  root 'pages#index'
  get 'pages/index'

  # mount ActionCable.server => '/cable'
end
