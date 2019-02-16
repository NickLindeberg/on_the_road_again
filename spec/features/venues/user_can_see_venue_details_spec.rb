require 'rails_helper'

RSpec.feature "AS a user" do
  describe "When I visit the venue show page" do
    it "I can see venue details" do
      VCR.use_cassette("venue_details") do
        artist = create(:artist)
        tour = create(:tour, artist: artist)
        event = create(:event, tour: tour, show_time:"2019-09-01")
        event2 = create(:event, name: "Wily Coyote!", tour: tour, show_time:"2015-10-01")
        venue = VenueBuilderFacade.new.find_single_venue_by_id(event.venue_id)

        visit venue_path(event.venue_id)

        expect(page).to have_content(venue.name)
        expect(page).to have_content(venue.address)
      end
    end
  end
end
