Rails.application.routes.draw do
  get '/', to: "welcome#index"
  get '/about', to: "about#index"

end
