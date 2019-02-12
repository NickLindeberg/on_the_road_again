Rails.application.routes.draw do
  get '/', to: "welcome#index"
  get '/about', to: "about#index"
  get '/dashboard', to: "artist#index"

  resources :venues, only: [:show]
  resources :events, only: [:show, :new, :create, :edit, :update]
  resources :tours, only: [:show, :new, :create, :edit, :update]
end
