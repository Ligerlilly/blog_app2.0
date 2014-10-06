Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
   
  root to: 'visitors#index'
  resources :entries do
    resources :comments
    resources :photos
  end
  
  resources :users
 
end
