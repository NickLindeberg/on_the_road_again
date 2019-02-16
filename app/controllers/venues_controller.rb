class VenuesController < ApplicationController

  def index
    service = VenueBuilderFacade.new
    service.find_venues_by_city("Denver")
  end
end
