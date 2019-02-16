Rails.application.routes.draw do
  get 'venues/show'
  root to: "welcome#index"
  get 'about', to: "about#index"
  get 'dashboard', to: "artists#show"

  resources :venues, only: [:index]
  resources :events, only: [:show]
  resources :tours, only: [:show, :new, :create, :edit, :update] do
    resources :events
  end

  get '/login', to: redirect('/auth/google_oauth2'), as: 'login'
  get '/register', to: redirect('/auth/google_oauth2'), as: 'register'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

end
