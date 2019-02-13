Rails.application.routes.draw do
  get '/', to: "welcome#index"
  get '/about', to: "about#index"
  get '/dashboard', to: "artist#index"

  resources :venues, only: [:show]
  resources :events, only: [:show, :new, :create, :edit, :update]
  resources :tours, only: [:show, :new, :create, :edit, :update]

  get "/register", to: "artists#new", as: "registration"

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
