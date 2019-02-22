class EventsController < ApplicationController


  def new
    @tour = Tour.find_by(id: params[:tour_id])
    @events = @tour.events.new
    @venues = service_venue.find_venues_by_city(params[:q])
  end

  def show
    @current_artist = current_artist
    @event = Event.find(params[:id])
    if @event.artist?
      @venue = service_venue.find_single_venue_by_id(@event.venue_id)
    else
      render file: '/public/404'
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.artist? == current_artist
      @event
    else
      render file: '/public/404'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] =  "#{@event.name} was successfully updated!"
      redirect_to @event
    else
      render :new
    end
  end

  def create
    tour = current_artist.tours.find_by(id: params[:tour_id])
    event = tour.events.create!(event_params)
    flash[:alert] = "Succesfully created #{event.name}!" if event
    redirect_to new_tour_event_path      
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:alert] = "Succesfully deleted #{@event.name}!"
    redirect_to tour_path(@event.tour)
  end

  private

  def event_auth
    @event.tour.artist_id == current_artist.id
  end

  def event_params
    params.require(:event).permit(:name, :show_time, :venue_id, :show_date, :event_profit, :travel_cost)
  end

  def service_venue
    VenueBuilderFacade.new
  end

end
