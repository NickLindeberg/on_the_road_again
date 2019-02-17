require 'rails_helper'

describe 'user dashboard' do
  it 'user can go to edit band information ' do
    artist = create(:artist)

    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

    visit dashboard_path

    click_on("Add New Band Details!")
    expect(current_path).to eq(edit_artist_path(artist.id))

    fill_in "artist[band_name]", with: "Jimmy and the Jets"
    click_on("Let's Roll!")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Jimmy and the Jets")
  end
end
