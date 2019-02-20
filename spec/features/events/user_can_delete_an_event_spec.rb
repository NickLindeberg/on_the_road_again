require 'rails_helper'

describe 'User can delete an event' do
  it 'is redirected to tour show page' do
    VCR.use_cassette("record-deletion") do
      artist = create(:artist)
      tour = create(:tour, artist:artist)
      event = create_list(:event, 5, tour: tour)
      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit tour_path(tour)
      save_and_open_page
      click_on "Delete Event"
      expect(current_path).to eq(tour_path(event.tour))
      expect(event.count).to eq(4)
    end
  end
end
