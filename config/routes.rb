Rails.application.routes.draw do
  resources :labels
  root to: 'tasks#index'
  # get     'login',   to: 'sessions#new'
  # post    'login',   to: 'sessions#create'
  # delete  'logout',  to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks
  resources :users
  
  namespace :admin do
    resources :users
  end
end
