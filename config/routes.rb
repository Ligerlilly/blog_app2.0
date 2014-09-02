Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :entries do
    resources :photos
  end
 
end
