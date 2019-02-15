require 'rails_helper'

describe "Venue Builder Facade " do
  it "exists" do
    @vfacade = VenueBuilderFacade.new
    expect(@vfacade).to be_a(VenueBuilderFacade)
  end

  it "#find_venues_by_city" do
    VCR.use_cassette("Venues_denver_casette") do
      @vfacade = VenueBuilderFacade.new

      expect(@vfacade.find_venues_by_city("Denver")).to be_a(Array)
      expect(@vfacade.find_venues_by_city("Denver")[0]).to be_a(Venue)

      venues = @vfacade.find_venues_by_city("Denver")
      venues.map do |venue|
        expect(venue).to be_a(Venue)
      end
    end
  end

  it "#find_single_venue_by_id" do
    VCR.use_cassette("venue_by_id_casette") do
      @vfacade = VenueBuilderFacade.new
      expect(@vfacade.find_single_venue_by_id(1451)).to be_a(Venue)
    end
  end
end
