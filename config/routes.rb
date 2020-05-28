Rails.application.routes.draw do
  resource :users, only: [ :new, :create, :show ]

  get '/login', :to => "session#login"
  post '/logout', :to => "session#logout"


  root "welcome#welcome"
end
