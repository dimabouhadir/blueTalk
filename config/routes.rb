Rails.application.routes.draw do
  root 'channels#index'
  get '/users/addUser', to: 'users#addUser'
  get '/channels/createChannel', to: 'channels#createChannel'
  get '/piconets/createPiconet', to: 'piconets#createPiconet'
  get '/users/join', to: 'users#join'
  get'/users/leavePiconet', to: 'users#leavePiconet'
  get'/messages/sendMessage', to: 'messages#sendMessage'
  get '/messages/forward', to: 'messages#forwa'
  resources :users
  resources :u_sers
  resources :piconets
  resources :messages
  resources :channels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
