Rails.application.routes.draw do
  get 'payments/success'
  get 'payments/failure'

  get 'orders/index'
  get 'orders/show/:id', to: "orders#show", as: "orders_show"

  resources :inboxes, except: [:edit, :update]
  post 'inboxes/message_create/:id', to: 'inboxes#message_create', as: "inbox_message_create"

  resources :addresses, except: [:create, :new, :index]
  resources :items
  get 'item/search(/:query)', to: "items#search", as: "item_search"


  devise_for :users, controllers: {
    registrations: "user/registrations"
  }

  root 'pages#index'
  get 'pages/index'

  get 'sample/sign/in', to: 'pages#sample_sign_in'

  # mount ActionCable.server => '/cable'
end
