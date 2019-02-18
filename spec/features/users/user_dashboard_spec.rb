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

  it 'user can see future toures' do
    artist_1 = create(:artist)

    tour_1 = create(:tour, artist_id: artist_1.id)
    event_1 = create(:event, tour_id: tour_1.id, show_date: "2017-02-11 21:10:51" )
    event_2 = create(:event, tour_id: tour_1.id, show_date: "2016-02-11 21:10:51" )
    event_3 = create(:event, tour_id: tour_1.id, show_date: "2015-02-11 21:10:51" )

    tour_2 = create(:tour, artist_id: artist_1.id)
    event_3 = create(:event, tour_id: tour_2.id, show_date: "2022-02-11 21:10:51" )
    event_3 = create(:event, tour_id: tour_2.id, show_date: "2021-02-11 21:10:51" )
    event_3 = create(:event, tour_id: tour_2.id, show_date: "2015-02-11 21:10:51" )


    # binding.pry
    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist_1)
    visit dashboard_path

    expect(page).to have_content(tour_1)
    expect(page).to have_content(tour_2)
  end
end
