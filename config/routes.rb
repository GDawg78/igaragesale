Rails.application.routes.draw do
  resources :items
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'items#index'
  resources :states
  resources :profiles
end
