require 'rails_helper'

RSpec.feature "AS a user" do
  describe "When I visit the venue show page" do
    let(:artist) { create(:artist)}
    let(:tour)   { create(:tour, artist: artist)}

    it "I can see forthcoming" do
      VCR.use_cassette("Venues_denver_forthcoming_events_casette") do
        event = create(:event, tour: tour, show_date: 10.days.from_now)
        event2 = create(:event, name: "Wily Coyote!", tour: tour, show_date:"2015-10-01")

        visit venue_path(event.venue_id)
        within(".f-tours") do
          expect(page).to have_content(event.name)
          expect(page).not_to have_content(event2.name)
        end
      end
    end

    it "I can see past events" do
      VCR.use_cassette("Venues_denver_past_events_casette") do
        event = create(:event, name: "On The Rocks", tour: tour, show_date:"2017-09-01")
        event2 = create(:event, tour: tour, show_date: 10.days.from_now)

        visit venue_path(event.venue_id)
        within(".p-tours") do
          expect(page).to have_content(event.name)
          expect(page).not_to have_content(event2.name)
        end
      end
    end
  end
end
