Rails.application.routes.draw do
  resource :users, only: [ :new, :create, :show ]
end
