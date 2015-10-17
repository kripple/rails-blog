Rails.application.routes.draw do

  root 'users#about'

  get 'login' => 'user_sessions#new'
  post 'users/sessions' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'

  post 'posts/filter' => 'posts#filter'
  post 'projects/filter' => 'projects#filter'
  
  resources :users, only: :update
  resources :posts, only: [:new, :index, :show, :create, :update]
  resources :projects, only: [:index, :new, :create, :update]
  resources :tags, only: [:new, :create]

end
