class ArtistsController < ApplicationController

  def show
    @current_artist = current_artist
    if @current_artist
    else
      redirect_to '/'
    end
  end
end
