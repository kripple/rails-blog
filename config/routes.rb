Rails.application.routes.draw do

  root 'users#about'

  get 'login' => 'user_sessions#new'
  post 'users/sessions' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'

  get 'posts/filter/:slug' => 'posts#filter'
  get 'projects/filter/:slug' => 'projects#filter'
  
  resources :users, only: [:update]
  resources :posts
  resources :projects
  resources :tags, only: [:new, :create, :destroy]

  match '/404', :to => 'errors#not_found', via: [:get, :post]
  match '/422', :to => 'errors#unprocessable_entity', via: [:get, :post]
  match '/500', :to => 'errors#internal_error', via: [:get, :post]

end
