Rails.application.routes.draw do
  resources :accounts
  root to: 'dashboard#index'
  devise_for :users
end
