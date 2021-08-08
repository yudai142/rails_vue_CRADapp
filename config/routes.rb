Rails.application.routes.draw do
  root to: 'home#index'
  # resources :books, only: [:index]
  namespace :api do
    resources :books, only: [:index, :show, :create, :update, :destroy]
    post   'signup',  controller: :users,    action: :create
    post   'signin',  controller: :sessions, action: :create
    delete 'signin', controller: :sessions, action: :destroy
    post   'refresh', controller: :refresh,  action: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
