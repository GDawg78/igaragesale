Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :states
  resources :profiles
  resources :charges
  match '/help', to: 'static_pages#help', via: 'get', as: :help
  match '/about', to: 'static_pages#about', via: 'get', as: :about
  
end
