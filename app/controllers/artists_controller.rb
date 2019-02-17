class ArtistsController < ApplicationController

  def show
    @current_artist = current_artist
    if @current_artist
    else
      redirect_to '/'
    end
  end

  def edit
    @current_artist = current_artist
  end

  def update
    current_artist.band_name = params[:artist][:band_name]
    @current_artist = current_artist
    redirect_to dashboard_path
  end
end
