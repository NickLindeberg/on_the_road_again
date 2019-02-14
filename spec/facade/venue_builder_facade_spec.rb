require 'rails_helper'

describe "Venue Builder Facade " do
  before(:each) do
    # VCR.use_cassette("Songkick_denver_casette") do
      @vfacade = VenueBuilderFacade.new
    # end
  end

  it "exists" do
    expect(@vfacade).to be_a(VenueBuilderFacade)
  end

  it "#find_venues_by_city" do
    expect(@vfacade.find_venues_by_city("Denver")).to be_a(Array)
    expect(@vfacade.find_venues_by_city("Denver")[0]).to be_a(Venue)
  end

  it "#find_single_venue_by_id" do
    expect(@vfacade.find_single_venue_by_id(1451)).to be_a(Venue)
  end
end
