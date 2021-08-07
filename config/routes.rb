Rails.application.routes.draw do
  get 'books/index'
  root to: 'home#index'
  # resources :books, only: [:index]
  get 'home/index'
  namespace :api do
    resources :books, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
