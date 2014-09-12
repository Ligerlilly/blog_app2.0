Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'
  resources :entries do
    resources :photos
  end
 
end
