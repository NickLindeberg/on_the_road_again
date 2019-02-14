class VenuesFacade
  def initialize(city)
    @city_venue_data = SongkickService.new.get_city_venues(city)
  end

  def venues
    @city_venue_data.map do |venue|
      Venue.new(venue)
    end
  end
end
