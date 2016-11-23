Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # root "static_pages#home"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  namespace :admin do
    root "dashboard#index"
    resources :categories
    resources :books
    resources :requests, except: [:create, :new, :edit]
    resources :users
  end
  root "static_pages#home"
  get "static_pages/help"
  get "static_pages/about"

  resources :users do
    member do
      get "/relationship", :to => "relationships#index", :as => :relationships
    end
    resources :review_votes, only: [:create, :destroy]
  end
  resources :books
  resources :users, except: [:new, :destroy, :create]
  resources :marks, only: [:new, :create, :destroy]
  resources :favorites, only: [:index, :new, :create, :destroy]
  resources :users, only: [:index, :edit, :update]
  resources :requests, except: [:edit, :update]
  resources :reviews, except: [:new, :index]
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create , :destroy, :edit, :update]
  resources :activities, only: [:index, :create]
  resources :likes, only: [:create, :destroy]
  resources :notifications, only: :index
  patch "update_notifications" => "notifications#update"
end
