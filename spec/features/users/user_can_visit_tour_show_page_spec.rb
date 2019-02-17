require 'rails_helper'

describe 'User can visit tour show page' do
  it 'sees tour data' do
    artist = create(:artist)
    tour = create(:tour, artist: artist)
    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

    visit tour_path(tour)

    expect(current_path).to eq(tour_path(tour))
    expect(page).to have_content("#{tour.name} Show Page")
    expect(page).to have_content("By: #{artist.name}")
  end
end
