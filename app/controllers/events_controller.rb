class EventsController < ApplicationController

  def new
    @tour = Tour.find_by(id: params[:tour_id])
    @events = @tour.events.new
    service = VenueBuilderFacade.new
    @venues = service.find_venues_by_city(params[:q])
  end

  def create
    tour = Tour.find_by(id: params[:tour_id])
    x = tour.events.create(event_params)
    flash[:notice] = "Event Added"
    redirect_to new_tour_event_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :show_time, :venue_id)
  end

end
