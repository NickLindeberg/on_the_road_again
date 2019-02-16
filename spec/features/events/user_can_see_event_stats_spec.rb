require 'rails_helper'

describe "Events" do
  it "event show page shows statistics on that particular event" do
    artist = create(:artist)
    tour = create(:tour, artist_id: artist.id)
    event_1 = create(:event, tour_id: tour.id)
    event_2 = create(:event, tour_id: tour.id)

    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

    visit 'event_path'

    expect(page).to have_content("")

  end
end
