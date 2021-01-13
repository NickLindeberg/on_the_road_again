require 'rails_helper'

describe 'User can edit an event' do
  let(:artist) { create(:artist) }

  it 'is redirected to event show page' do
    VCR.use_cassette("record-edit") do
      tour = create(:tour, artist:artist)
      event = create(:event, tour: tour, name: "Renegade", show_date: "2018-02-02", show_time: "8:00 PM")
      allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)

      visit edit_event_path(event)
      fill_in "name",	with: "Ava"
      fill_in "show_date",	with: "2018-08-02"
      fill_in "show_time",	with: "10:00 PM"
      click_on "Update Event"

      expect(current_path).to eq(event_path(event))
      expect(event.name).to_not eq("Renegade")
      expect(event.name).to_not eq("2018-02-02")
      expect(event.name).to_not eq("8:00 Pm")
      expect(event.name).to eq("Ava")
      expect(event.show_date).to eq("2018-08-02")
      expect(event.name).to eq("10:00 PM")
    end
  end
end
