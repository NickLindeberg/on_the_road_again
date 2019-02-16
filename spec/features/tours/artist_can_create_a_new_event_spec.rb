require 'rails_helper'

describe 'New events' do
  it 'lets artist add events to a tour' do
    artist = create(:artist)
    tour = create(:tour, artist_id: artist.id)

    new_tour_event_path

    expect(page).to have_content(tour.name)
    save_and_open_page
  end
end
