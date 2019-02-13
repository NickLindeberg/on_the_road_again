class ArtistsController < ApplicationController
  def show
    @current_artist = current_user
  end
end
