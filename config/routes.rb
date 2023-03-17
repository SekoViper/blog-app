Rails.application.routes.draw do

  root 'users#index'

  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
