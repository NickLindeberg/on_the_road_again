class EventsController < ApplicationController

  def new
    @tour = current_artist.tours.find_by(params[:id])
    @events = @tour.events.new
    @venues = service_venue.find_venues_by_city(params[:q])
  end

  def show
    @event = Event.find(params[:id])
    @venue = service_venue.find_single_venue_by_id(@event.venue_id)
  end

  def create

  end

  private

  def event_params
    params.require(:event).permit(:name, :show_time, :venue_id)
  end

  def service_venue
    VenueBuilderFacade.new
  end
end
