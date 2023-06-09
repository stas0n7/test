Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users/dashboard#show'

  get '/sign_up', to: 'registration#new'
  post '/sign_up', to: 'registration#create'

  get '/sign_in', to: 'users/sessions#new'
  post '/sign_in', to: 'users/sessions#create'
  delete '/sign_out', to: 'users/sessions#destroy'

  get '/dashboard', to: 'users/dashboard#show'

  post '/avatars', to: 'users/avatars#create'
end
