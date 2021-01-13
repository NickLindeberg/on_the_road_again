require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:google_token) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:google_client_id) }
  end

  describe 'Relationship' do
    it { should have_many(:tours) }
  end

  describe "Methods" do
    let(:artist)        { create(:artist) }
    let(:past_tour)     { create(:tour, artist_id: artist.id) }
    let(:future_tour)   { create(:tour, artist_id: artist.id) }
    let!(:future_event) { create(:event, tour_id: future_tour.id, show_date: 10.days.from_now) }
    let!(:past_event)   { create(:event, tour_id: past_tour.id, show_date: 10.days.ago) }

    it "#future_tours" do
      expect(artist.future_tours).to be_a(Array)
      expect(artist.future_tours).to eq([future_tour])
      expect(artist.future_tours).not_to eq([past_tour])
    end

    it "#past_tours" do
      expect(artist.past_tours).to be_a(Array)
      expect(artist.past_tours).to eq([past_tour])
      expect(artist.past_tours).not_to eq([future_tour])
    end
  end
end
