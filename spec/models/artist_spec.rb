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

  let(:artist) { create(:artist) }
  let(:tour)   { create(:tour, artist_id: artist.id) }

  describe "Methods" do
    it "#future_tours" do
      event_1 = create(:event, tour_id: tour.id, show_date: 10.days.from_now )
      event_2 = create(:event, tour_id: tour.id, show_date: 11.days.from_now )
      event_3 = create(:event, tour_id: tour.id, show_date: 12.days.from_now )

      tour_2 = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour_2.id, show_date: 10.days.ago )
      event_2 = create(:event, tour_id: tour_2.id, show_date: 11.days.ago )
      event_3 = create(:event, tour_id: tour_2.id, show_date: 12.days.ago )

      expect(artist.future_tours).to be_a(Array)
      expect(artist.future_tours).to eq([tour])
    end

    it "#past_tours" do
      event_1 = create(:event, tour_id: tour.id, show_date: 10.days.from_now )
      event_2 = create(:event, tour_id: tour.id, show_date: 11.days.from_now )
      event_3 = create(:event, tour_id: tour.id, show_date: 12.days.from_now )

      tour_2 = create(:tour, artist_id: artist.id)
      event_1 = create(:event, tour_id: tour_2.id, show_date: 10.days.ago )
      event_2 = create(:event, tour_id: tour_2.id, show_date: 11.days.ago )
      event_3 = create(:event, tour_id: tour_2.id, show_date: 12.days.ago )

      expect(artist.past_tours).to be_a(Array)
      expect(artist.past_tours).to eq([tour_2])
    end
  end
end
