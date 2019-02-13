require 'rails_helper'

describe 'user dashboard' do
  it 'shows information about user and their tours' do
    artist = create(:artist)
    # allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

    visit '/dashboard'

    # expect(page).to have_content(artist.name)
    expect(page).to have_content("Past Tours")
    expect(page).to have_content("Future Tours")
  end
end
