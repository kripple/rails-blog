Rails.application.routes.draw do

  root 'users#about'

  get 'login' => 'user_sessions#new'
  post 'users/sessions' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'

  post 'posts/filter' => 'posts#filter'
  post 'projects/filter' => 'projects#filter'

  # post 'tags/add/:id' => 'tags#add'
  
  resources :users, only: [:create, :update]
  resources :posts
  resources :projects
  resources :tags, only: [:new, :create, :destroy]

end
