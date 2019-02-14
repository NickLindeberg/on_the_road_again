class VenuesController < ApplicationController
  def show
    @venue = Venue.find(params[:id])
    @events = Event.all
  end
end
