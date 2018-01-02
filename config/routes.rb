Rails.application.routes.draw do
  # get 'feature/show'

  # post 'feature/update'

  # get 'feature/index'

  # post 'feature/create'
  resources :feature, only: [:index, :show, :update, :create]

  resources :comment, only: [:index, :create]

  resources :invoice_datum, only: [:show, :update, :create]

  resources :command, only: [:index, :show, :update, :create]

  resources :phone, only: [:update]

  resources :estimate, only: [:index, :create, :update]

  resources :contract, only: [:index, :create, :update]

  resources :invoice, only: [:index, :create, :update]

  resources :admin, only: [:index]
  get 'admin-command' => 'admin#command'
  post 'admin-command' => 'command#create'
  post 'admin-create-user' => 'admin#create_user'
  resources :user_interface, only: [:index]

  devise_for :users

  scope '(:locale)', locale: /en/ do

    resources :home, only: [:create, :index]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'home#index'
  end

end
