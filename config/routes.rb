Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'

  
  resources :projects
  
  get '/register', to: 'developers#new'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
end

