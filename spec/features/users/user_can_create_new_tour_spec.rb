require 'rails_helper'

describe 'Artist can create a tour' do
  it 'names a tour' do
    artist = create(:artist)
    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

    visit dashboard_path

    click_on "Add New Tour"

    expect(current_path).to eq(new_tour_path)

    fill_in "tour[name]", with: "Rad Tour"
    click_on "Create Tour"

    tour = Tour.last
    expect(current_path).to eq(new_tour_event_path(tour.id))
  end
end
