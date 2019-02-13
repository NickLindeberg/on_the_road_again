class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= Artist.find(session[:artist_id]) if session[:artist_id]
  end
end
