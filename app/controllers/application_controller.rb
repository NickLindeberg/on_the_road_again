class ApplicationController < ActionController::Base

  def current_artist
    @current_artist ||= Artist.find(session[:artist_id]) if session[:artist_id]
  end

  helper_method :current_user
end
