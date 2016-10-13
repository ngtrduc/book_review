Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "static_pages#home"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  get "static_pages/help"
  get "static_pages/about"

  namespace :admin do
    root "categories#index"
    resources :categories
    resources :books
    resources :requests, only: [:index, :update]
    resources :users
  end

  resources :users do
    member do
      get "/:relationship", :to => "relationships#index", :as => :relationships
    end
  end
  resources :books
  resources :users, except: [:new, :destroy, :create]
  resources :marks, only: [:create, :destroy, :new]
  resources :users, only: [:index, :edit, :update]
  resources :requests, except: [:edit, :update]
  resources :reviews, except: [:show, :new, :index]
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create]
end
