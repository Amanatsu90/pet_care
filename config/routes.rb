Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
      get 'favorites'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
