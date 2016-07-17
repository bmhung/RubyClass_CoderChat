Rails.application.routes.draw do
  resources :messages
  root 'users#new'
  resources :users
  get 'sign_in' => 'users#sign_in' 
  get 'sign_out' => 'sessions#destroy'
  post 'sessions/create'
  get 'sent_messages' => 'messages#sent'  
  match 'add_friend' => 'users#add_friend', via: [:get, :post]
  post 'remove_friend' => 'users#remove_friend'
end
