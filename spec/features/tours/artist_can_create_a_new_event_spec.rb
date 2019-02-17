require 'rails_helper'

describe 'New events' do
  it 'lets artist add events to a tour' do
    artist = create(:artist)
    tour = create(:tour, artist_id: artist.id)

    visit new_tour_event_path(tour.id)

    expect(page).to have_content(tour.name)

    click_on "Search City"
    fill_in :q, with: "denver"
    click_on "Locate"
    fill_in "event[name]", with: "Summit Show"
    fill_in "event[show_time]", with: "2020/01/01"
    click_on "Create Event"
    expect(current_path).to eq(new_tour_event_path(tour.id))

    click_on "Search City"
    fill_in :q, with: "fort wayne"
    click_on "Locate"
    fill_in "event[name]", with: "Rail Show"
    fill_in "event[show_time]", with: "2020/01/05"
    click_on "Create Event"
    expect(current_path).to eq(new_tour_event_path(tour.id))

    expect(tour.events.count).to eq(2)
    summit = Event.first
    rail = Event.last

    expect(page).to have_content(summit.name)
    expect(page).to have_content(rail.name)

    click_on "Tour Booked"
  end
end
