Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :entries do
   
  end
  resources :photos
end
