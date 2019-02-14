class ArtistsController < ApplicationController

  def show
    @current_artist = current_artist
    # @facade = VenuesFacade
  end
end
