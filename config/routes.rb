Rails.application.routes.draw do
  root to: 'home#index'
  # resources :books, only: [:index]
  namespace :api do
    resources :books, only: [:index, :show, :create, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
