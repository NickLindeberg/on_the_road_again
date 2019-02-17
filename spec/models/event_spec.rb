require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:show_time) }
  end

  describe 'Relationship' do
    it { should belong_to(:tour) }
  end


  xdescribe "methods" do
    it "#total_profit" do
      artist = create(:artist)
      tour = create(:tour, artist_id: artist.id)
      event = create(:event, tour_id: tour.id, show_date: "2018-02-11 21:10:51", event_profit: "200.00", travel_cost: "150.00" )

      expect(event.total_profit).to eq("$50.00")
    end
  end
end
