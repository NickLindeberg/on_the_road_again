require 'rails_helper'

RSpec.describe Tour, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Relationship' do
    it { should belong_to(:artist)}
    it { should have_many(:events)}
  end

  describe "Methods" do
    it "#future_events" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2020-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2021-02-11 21:10:51" )

      expect(tour.future_events).to be_a(Array)
      expect(tour.future_events).to eq([event_2, event_3])
    end

    it "#past_events" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2018-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2021-02-11 21:10:51" )

      expect(tour.past_events).to be_a(Array)
      expect(tour.past_events).to eq([event_1, event_2])
    end
  end
end
