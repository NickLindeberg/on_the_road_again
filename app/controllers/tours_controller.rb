class ToursController < ApplicationController

  def new
    @tour = Tour.new()
  end

  def create
    tour = current_artist.tours.create(tour_params)

    redirect_to "/tours/#{tour.id}/events/new"
  end

  def show
    @tour = current_artist.tours.find(params[:id])
    @events = @tour.events
  end

  def destroy
    tour = current_artist.tours.find(params[:id])
    tour.destroy
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
