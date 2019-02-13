class ApplicationController < ActionController::Base
  helper_method :current_artist

  def current_artist
    @current_artist ||= Artist.find(session[:artist_id]) if session[:artist_id]
  end
end
