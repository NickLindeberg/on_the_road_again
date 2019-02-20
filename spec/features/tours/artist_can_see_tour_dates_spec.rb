require 'rails_helper'

describe "tour show (artist dashboard)" do
  it "shows tour dates based on event dates" do

    artist = create(:artist)
    tour_0 = create(:tour, artist_id: artist.id, name: "Silver and the Jets")
    event_0 = create(:event, tour_id: tour_0.id, show_date: "2018-01-11 21:10:51", event_profit: 200.00, travel_cost: 150.00 )
    event_1 = create(:event, tour_id: tour_0.id, show_date: "2018-03-24 21:10:51", event_profit: 200.00, travel_cost: 150.00 )
    event_2 = create(:event, tour_id: tour_0.id, show_date: "2018-09-24 21:10:51", event_profit: 200.00, travel_cost: 150.00 )

    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

    visit dashboard_path
    expect(page).to have_content(tour_0.name)
    expect(page).to have_content(event_0.show_date.to_date)
    expect(page).to have_content(event_2.show_date.to_date)
  end
end
