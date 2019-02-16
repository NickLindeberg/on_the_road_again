class EventsController < ApplicationController

  def new
    @tour = current_artist.tours.find_by(params[:id])
    @events = @tour.events.new
    @venues = service_venue.find_venues_by_city(params[:q])
  end

  def show
    @current_artist = current_artist
    @event = Event.find(params[:id])
    @venue = service_venue.find_single_venue_by_id(@event.venue_id)
  end

  def update
    event_profit = params[:event][:event_profit].to_f
    travel_cost = params[:event][:travel_cost].to_f
    profit_stats_update(event_profit, travel_cost)
    redirect_to event_path(current_artist.events.first.id)
  end

  def create

  end

  private

  def profit_stats_update(event_profit, travel_cost)
    current_artist.events[0].update!(event_profit: event_profit)
    current_artist.events[0].update!(travel_cost: travel_cost)
  end

  def event_params
    params.require(:event).permit(:name, :show_time, :venue_id)
  end

  def service_venue
    VenueBuilderFacade.new
  end
end
