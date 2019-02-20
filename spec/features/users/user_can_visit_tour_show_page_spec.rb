require 'rails_helper'

describe 'User can visit tour show page' do
  it 'sees tour data' do
    artist = create(:artist, band_name: "Rad and the Rads")
    tour = create(:tour, artist: artist)
    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

    visit tour_path(tour)

    expect(current_path).to eq(tour_path(tour))
    expect(page).to have_content("#{tour.name}")
    expect(page).to have_content("By: #{artist.band_name}")
  end

  it 'user can visit tour show throught the dashboard' do
    artist_1 = create(:artist)

    tour_1 = create(:tour, artist_id: artist_1.id)
    event_1 = create(:event, tour_id: tour_1.id, show_date: "2017-02-11 21:10:51", event_profit: 150.00, travel_cost: 50.00)
    event_2 = create(:event, tour_id: tour_1.id, show_date: "2016-02-11 21:10:51", event_profit: 150.00, travel_cost: 50.00)
    event_3 = create(:event, tour_id: tour_1.id, show_date: "2015-02-11 21:10:51", event_profit: 150.00, travel_cost: 50.00)

    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist_1)
    visit dashboard_path

    expect(page).to have_content(tour_1.name)
    click_on(tour_1.name)
    expect(current_path).to eq(tour_path(tour_1.id))
  end

  it 'Artist can edit tour name' do
    artist_1 = create(:artist, name: "Mr. Meeseeks")

    tour_1 = create(:tour, artist_id: artist_1.id, name: "Jimmy and the Jets")
    event_1 = create(:event, tour_id: tour_1.id, show_date: "2017-02-11 21:10:51", event_profit: 150.00, travel_cost: 50.00)
    event_2 = create(:event, tour_id: tour_1.id, show_date: "2016-02-11 21:10:51", event_profit: 150.00, travel_cost: 50.00)
    event_3 = create(:event, tour_id: tour_1.id, show_date: "2015-02-11 21:10:51", event_profit: 150.00, travel_cost: 50.00)

    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist_1)
    visit tour_path(tour_1.id)

    expect(page).to have_content(tour_1.name)
    expect(page).to have_content("Edit Tour")
    click_on("Edit Tour")
    expect(current_path).to eq(edit_tour_path(tour_1))

    fill_in "tour[name]", with: "Silver and the Jets"
    click_on("Update")
    expect(current_path).to eq(tour_path(tour_1))
    expect(page).to have_content("Silver and the Jets")
  end
end
