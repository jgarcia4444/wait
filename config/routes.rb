Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :show ]

  get '/login', :to => "session#new"
  post '/login', :to => "session#create"
  post '/logout', :to => "session#logout"

  resources :users, only: [:show] do
    resources :weights, only: [:show, :index, :new, :edit]
  end

  resources :weights, only: [:create, :update, :destroy]

  resources :health_tips

  root "welcome#home"
end
