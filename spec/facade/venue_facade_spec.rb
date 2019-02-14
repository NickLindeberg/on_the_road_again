require 'rails_helper'

describe "Venue Facade " do
  before(:each) do
    # VCR.use_cassette("Songkick_denver_casette") do
      @vfacade = VenuesFacade.new("Denver")
    # end
  end

  it "exists" do
    expect(@vfacade).to be_a(VenuesFacade)
  end

  it "#venues" do
    expect(@vfacade.venues).to be_a(Array)
     expect(@vfacade.venues[0]).to be_a(Venue)
  end
end
