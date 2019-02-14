class VenueIdSearchFacade
  def initialize(venue_id)
    @venue_data = SongkickService.new.get_venue_by_id(venue_id)
  end

  def single_venue_data
    Venue.new(@venue_data)
  end
end
