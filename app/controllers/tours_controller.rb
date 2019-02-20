class ToursController < ApplicationController

  def new
    @tour = Tour.new()
  end

  def create
    artist = current_artist
    tour = artist.tours.create(tour_params)

    redirect_to "/tours/#{tour.id}/events/new"
  end

  def show
    @tour = Tour.find(params[:id])
    @events = @tour.events
  end

  def destroy
    Tour.destroy(params[:id])
    redirect_to dashboard_path
  end

  def edit
    @tour = current_artist.tours.find(params[:id])
  end

  def update
    tour = current_artist.tours.find(params[:id])
    tour.name = params[:tour][:name]
    tour.save!
    redirect_to tour_path(tour)
  end


  private

  def  tour_params
    params.require(:tour).permit(:name)
  end
end
