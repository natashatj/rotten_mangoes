Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  # get 'movies/index'

  # get 'movies/show'

  # get 'movies/new'

  # get 'movies/edit'
  resources :movies
  resources :users, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
