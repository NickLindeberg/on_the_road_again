Rails.application.routes.draw do
  root to: "welcome#index"
  get 'about', to: "about#index"
  get 'dashboard', to: "artists#show"

  resources :artists, only: [:edit, :update]
  resources :venues, only: [:show]
  resources :events
  resources :tours, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :events, only: [:new, :create]
  end

  get '/login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/register', to: redirect('/auth/google_oauth2'), as: 'register'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
