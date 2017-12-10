Rails.application.routes.draw do
  root 'channels#index'
  get '/users/addUser', to: 'users#addUser'
  resources :users
  resources :u_sers
  resources :piconets
  resources :messages
  resources :channels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
