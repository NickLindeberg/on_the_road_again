require 'rails_helper'

describe 'User can delete an event' do
  it 'is redirected to tour show page' do
    VCR.use_cassette("record-deletion") do
      artist = create(:artist)
      tour = create(:tour, artist:artist)
      event_1 = create(:event, tour_id: tour.id, show_date: 10.days.from_now)
      event_2 = create(:event, tour_id: tour.id, show_date: 12.days.from_now)
      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)
      expect(Event.count).to eq(2)
      visit tour_path(tour)

      first(:link, "Delete Event").click

      expect(current_path).to eq(tour_path(tour))
      expect(Event.count).to eq(1)
    end
  end
end
