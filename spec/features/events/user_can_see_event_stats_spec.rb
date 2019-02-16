require 'rails_helper'

describe "Events" do
  it "event show page shows statistics on that particular event" do
    VCR.use_cassette("event_show_casette") do

      artist = create(:artist)
      tour = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour.id)

      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit event_path(event_1.id)
      expect(page).to have_content(event_1.name)
      expect(page).to have_content("Date: #{event_1.show_date}")
      expect(page).to have_content("Time: #{event_1.show_time}")
      expect(page).to have_content("Where:")
    end
  end

  xit "event show has link to to venue show page " do
    VCR.use_cassette("event_stats_casette") do

      artist = create(:artist)
      tour = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour.id)

      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit event_path(event_1.id)

      expect(page).to have_link("Venue Information", :href => "actual link")
    end
  end

  it "logged in Artist sees form for past event only  " do
    VCR.use_cassette("event_stats_casette") do

      artist = create(:artist)
      tour = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour.id)

      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit event_path(event_1.id)

      expect(page).to have_content("Profit Statistics")
      fill_in "event[event_profit]", with: "2000.00"
      fill_in "event[travel_cost]", with: "150.00"

      click_on "Calculate Profit"

      expect(current_path).to eq(event_path(event_1.id))
      save_and_open_page
      expect(page).to eq(event_1.event_profit)
      expect(page).to eq(event_1.travel_cost)
    end
  end
end
