class ToursController < ApplicationController

  def new
    @tour = Tour.new()
  end

  def create
    artist = current_artist
    tour = artist.tours.create(tour_params)

    redirect_to dashboard_path
  end

  def show
    @tour = Tour.find(params[:id])
  end

  private

  def  tour_params
    params.require(:tour).permit(:name)
  end
end
