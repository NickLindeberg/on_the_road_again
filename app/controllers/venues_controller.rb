class VenuesController < ApplicationController

  def show
    @events = Event.where(venue_id: params[:id])
    @venue ||= @venue = VenueBuilderFacade.new.find_single_venue_by_id(params[:id])
  end
end
