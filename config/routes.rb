Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
   
  root to: 'visitors#index'
  resources :entries do
    get 'archive'
    resources :comments
    resources :photos
  end
  namespace :admin do
    root to: 'base#index'
    resources :users do
      collection do
        get :edit_multiple
        put :update_multiple
      end
    end
  end
end
