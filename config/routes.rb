Rails.application.routes.draw do

  get 'reviews/new'

  get 'reviews/create'

  get 'sessions/new'

  get 'sessions/create'

  # get 'users/new'

  # get 'users/create'

  # get 'movies/index'

  # get 'movies/show'

  # get 'movies/new'

  # get 'movies/edit'
  resources :sessions, only: [:new, :create]
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
