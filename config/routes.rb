Rails.application.routes.draw do

  root 'users#about'

  get 'login' => 'user_sessions#new'
  get 'dashboard' => 'users#dashboard'
  post 'dashboard' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'

  post 'posts/filter' => 'posts#filter'
  post 'projects/filter' => 'projects#filter'
  
  resources :users, only: [:create, :update]
  resources :posts, only: [:new, :index, :show, :create, :update]
  resources :projects, only: [:index, :new, :show, :create, :update]
  resources :tags, only: [:new, :create]

end
