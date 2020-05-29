Rails.application.routes.draw do
  resource :users, only: [ :new, :create, :show ]

  get '/login', :to => "session#new"
  post '/login', :to => "session#create"
  post '/logout', :to => "session#logout"

  resource :users do
    resource :weights
  end

  root "welcome#home"
end
