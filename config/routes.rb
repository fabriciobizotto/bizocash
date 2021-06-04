Rails.application.routes.draw do
  resources :tags
  resources :accounts
  root to: 'dashboard#index'
  devise_for :users
end
