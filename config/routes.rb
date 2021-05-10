Rails.application.routes.draw do
  # get '/signup', to: "registrations#new"
  # post '/signup', to: "registrations#create"

  root "welcome#about"

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :messages
  resources :chatroom_instances
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html*

end
