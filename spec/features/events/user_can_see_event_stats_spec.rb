require 'rails_helper'

describe "Events" do
  it "event show page shows statistics on that particular event" do
    VCR.use_cassette("event_stats_casette") do

      artist = create(:artist)
      tour = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour.id)

      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit event_path(event_1.id)
      save_and_open_page
      expect(page).to have_content("event_1.name")
      expect(page).to have_content("event_1.show_time")
    end
  end
end
