require 'rails_helper'

describe "Artist tour" do
  it "Artist can delete a tour from the dashboard" do
    VCR.use_cassette("tour_delete_casette") do

      artist = create(:artist)
      tour_0 = create(:tour, artist_id: artist.id)
      event_0 = create(:event, tour_id: tour_0.id, show_date: "2015-02-11 21:10:51", event_profit: 200.00, travel_cost: 150.00 )
      event_1 = create(:event, tour_id: tour_0.id, show_date: "2017-01-11 21:10:51", event_profit: 200.00, travel_cost: 150.00 )


      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit dashboard_path
      expect(page).to have_content(tour_0.name)
      expect(artist.tours.count).to eq(1)
      expect(page).to have_link("Delete Tour")

      click_on("Delete Tour")
      expect(artist.tours.count).to eq(0)
    end
  end
end
