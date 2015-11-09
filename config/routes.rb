Rails.application.routes.draw do

  root 'users#about'

  get 'login' => 'user_sessions#new'
  post 'users/sessions' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'

  post 'posts/filter/:slug' => 'posts#filter'
  post 'projects/filter/:slug' => 'projects#filter'
  
  resources :users, only: [:update]
  resources :posts
  resources :projects
  resources :tags, only: [:new, :create, :destroy]

end
