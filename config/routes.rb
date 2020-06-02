Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :show, :edit, :update ]

  get '/login', :to => "session#new"
  post '/login', :to => "session#create"
  post '/logout', :to => "session#logout"
  get '/auth/:provider/callback', to: 'session#create'
  get '/users/:id/edit', to: "users#edit"

  resources :users, only: [:show] do
    resources :weights, only: [:show, :index, :new, :edit]
  end

  resources :weights, only: [:create, :update, :destroy]

  resources :health_tips

  resources :health_tips, only: [:show] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:show] do
    resources :replies, only: [:create]
  end

  root "welcome#home"
end
