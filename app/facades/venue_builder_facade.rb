class VenueBuilderFacade

  def find_venues_by_city(city)
    city_venues_data = service.get_city_venues(city)
    city_venues_data.map do |venue|
      Venue.new(venue)
    end
  end

  def find_single_venue_by_id(id)
    single_venue_data = service.get_venue_by_id(id)
    Venue.new(single_venue_data)
  end

  def service
    SongkickService.new
  end
end
