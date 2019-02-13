class VenueFacade
  def initialize(city)
    @city_venue_data = SongkickService.new.get_city_venues(city)
  end
end
