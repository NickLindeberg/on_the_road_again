Rails.application.routes.draw do
  get '/', to: "welcome#index"
  get '/about', to: "about#index"
  get '/dashboard', to: "artists#show"

  resources :venues, only: [:show]
  resources :events, only: [:show, :new, :create, :edit, :update]
  resources :tours, only: [:show, :new, :create, :edit, :update]

  get '/login', to: redirect('/auth/google_oauth2'), as: 'login'
  get '/register', to: redirect('/auth/google_oauth2'), as: 'register'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
