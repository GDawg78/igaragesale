Rails.application.routes.draw do
  resources :items
  devise_for :users
  root to: 'home#home'
  resources :states
  resources :profiles
end
