class SessionsController < ApplicationController
  def create
    @artist = Artist.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    session[:artist_id] = @artist.id
    redirect_to dashboard_path
  end
end
