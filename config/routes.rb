Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'groups#index'
  resources :groups, only: %i[index new create destroy show edit update] do
    resources :students, only: %i[destroy new create edit update show]
  end
  resources :notes, only: %i[destroy new create edit update]
  resources :grades, only: %i[new create destroy]

  mount API::Base, at: '/'
end
