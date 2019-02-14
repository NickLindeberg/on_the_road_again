require 'rails_helper'

RSpec.feature "AS a user" do
  describe "When I visit the venue show page" do
    it "I can see forthcoming" do
      artist = create(:artist)
      venue = create(:venue)
      tour = create(:tour, artist: artist)
      event = create(:event, venue: venue, tour: tour, show_time:"2019-09-01")
      event2 = create(:event, name: "Wily Coyote!", venue: venue, tour: tour, show_time:"2015-10-01")

      visit venue_path(venue)
      within(".f-tours") do
        expect(page).to have_content(event.name)
        expect(page).not_to have_content(event2.name)
      end
    end
  end

    it "I can see past events" do
      artist = create(:artist)
      venue = create(:venue)
      tour = create(:tour, artist: artist)
      event = create(:event, name: "On The Rocks", venue: venue, tour: tour, show_time:"2017-09-01")
      event2 = create(:event, venue: venue, tour: tour, show_time:"2020-10-01")

      visit venue_path(venue)
      within(".p-tours") do
        expect(page).to have_content(event.name)
        expect(page).not_to have_content(event2.name)
    end
  end
end