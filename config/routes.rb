Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'pages#home'

  get '/pages/:id' => 'pages#show', as: 'profile'

#Nest the likes resource inside the posts resource


  get '/posts' => 'posts#index', as: 'posts'
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show' , as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  get '/comments' => 'comments#index', as: 'comments'
  get '/comments/new' => 'comments#new', as: 'new_comment'
  post '/comments' => 'comments#create'
  get '/comments/:id' => 'comments#show' , as: 'comment'
  get '/comments/:id/edit' => 'comments#edit', as: 'edit_comment'
  patch '/comments/:id' => 'comments#update'
  delete '/comments/:id' => 'comments#destroy'


  get '/categories' => 'categories#index', as: 'categories'
  get '/categories/:id' => 'categories#show', as: 'category'

  resources :posts do
    resources :likes
  end


end