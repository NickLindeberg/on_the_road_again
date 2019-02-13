require 'rails_helper'

RSpec.feature "AS a user" do
  describe "When I visit the venue show page" do
    it "I can see venue details" do
      venue = create(:venue)

      visit venue_path(venue)

      expect(page).to have_content(venue.name)
      expect(page).to have_content(venue.address)
    end
  end
end