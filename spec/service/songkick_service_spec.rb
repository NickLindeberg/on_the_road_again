require 'rails_helper'

describe SongkickService do
  it " Gets JSON data" do
    VCR.use_cassette("Songkick_denver_casette") do
      service = SongkickService.new
      venue_data = service.get_city_venues("Denver")

      expect(service).to be_an_instance_of(SongkickService)

      expect(venue_data).to be_a(Array)
      expect(venue_data[0]).to have_key(:metroArea)
      expect(venue_data[0]).to have_key(:website)
      expect(venue_data[0]).to have_key(:city)
      expect(venue_data[0]).to have_key(:capacity)
      expect(venue_data[0]).to have_key(:phone)
      expect(venue_data[0]).to have_key(:lat)
      expect(venue_data[0]).to have_key(:lng)
    end
  end

  it '#get_venue_by_id' do
    service = SongkickService.new
    venue_data = service.get_venue_by_id(10459)

    expect(service).to be_an_instance_of(SongkickService)

    expect(venue_data).to be_a(Hash)
    expect(venue_data).to have_key(:metroArea)
    expect(venue_data).to have_key(:website)
    expect(venue_data).to have_key(:city)
    expect(venue_data).to have_key(:capacity)
    expect(venue_data).to have_key(:phone)
    expect(venue_data).to have_key(:lat)
    expect(venue_data).to have_key(:lng)
  end
end
