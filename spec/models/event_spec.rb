require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:show_time) }
  end

  describe 'Relationship' do
    it { should belong_to(:tour) }
  end

  describe "Methods" do
    let(:artist) { create(:artist) }
    let(:tour)   { create(:tour, artist: artist) }
    let(:event)  { create(:event, tour_id: tour.id, event_profit: 200.00, travel_cost: 150.00) }

    it "#total_profit" do
      expect(event.total_profit).to eq(50.00)
    end
  end
end
