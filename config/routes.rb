Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :states
  resources :profiles
  resources :charges
end
