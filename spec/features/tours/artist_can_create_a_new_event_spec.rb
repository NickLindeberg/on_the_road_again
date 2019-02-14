require 'rails_helper'

describe 'New events' do
  it 'lets artist add events to a tour' do
    artist = create(:artist)
    tour = create(:tour, artist_id: artist.id)

    visit "/tours/#{tour.id}/events/new"

    

  end
end
