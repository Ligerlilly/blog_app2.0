Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
  root to: 'visitors#index'
  resources :entries do
    get 'archive'
    get 'feed', on: :member
    resources :comments
    resources :photos
  end




  namespace :admin do
    root to: 'base#index'
    resources :comments
    resources :users do
      collection do
        get :edit_multiple
        put :update_multiple
      end
    end
  end
end
