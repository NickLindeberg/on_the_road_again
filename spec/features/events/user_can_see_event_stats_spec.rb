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
      expect(page).to have_content("Date: #{event_1.show_date.to_date}")
      expect(page).to have_content("Time: #{event_1.show_time}")
      expect(page).to have_content("Where:")
    end
  end

  it "event show has link to to venue show page " do
    VCR.use_cassette("event_stats_1_casette") do

      artist = create(:artist)
      tour = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour.id)
      venue = VenueBuilderFacade.new.find_single_venue_by_id(event_1.venue_id)

      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit event_path(event_1.id)

      click_on(venue.name)
      expect(current_path).to eq(venue_path(event_1.venue_id))
    end
  end

  it "logged in Artist sees form for past event only  " do
    VCR.use_cassette("event_stats_2_casette") do

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

      expect(page).to have_content(event_1.event_profit)
      expect(page).to have_content(event_1.travel_cost)
    end
  end

  it "logged in Artist does not see statistics for a feature event" do
    VCR.use_cassette("past_event_stats_3_casette") do

      artist = create(:artist)
      tour = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2018-02-11 21:10:51", event_profit: 200.00, travel_cost: 150.00 )

      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit event_path(event_1.id)

      expect(page).to have_content("Event Statistics")
      expect(page).to  have_content(event_1.event_profit)
      expect(page).to  have_content(event_1.travel_cost)
    end
  end
end
