Rails.application.routes.draw do
  root to: "welcome#index"
  get 'about', to: "about#index"
  get 'dashboard', to: "artists#index"

  resources :venues, only: [:show]
  resources :events, only: [:show, :new, :create, :edit, :update]
  resources :tours, only: [:show, :new, :create, :edit, :update]
end
