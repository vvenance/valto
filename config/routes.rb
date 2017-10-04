Rails.application.routes.draw do
  get 'command/new'

  post 'command/create'

  post 'phone/update'

  get 'admin/show'
  get 'admin/command'

  get 'user_interface/index'

  devise_for :users

  scope '(:locale)', locale: /en/ do

    resources :home, only: [:create, :index]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'home#index'
  end

end
