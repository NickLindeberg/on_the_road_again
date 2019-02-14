class ArtistsController < ApplicationController

  def show
    @current_artist = current_artist
  end
end
