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
    it "#future_events_list" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2020-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2021-02-11 21:10:51" )

      expect(tour.future_events_list).to be_a(Array)
      expect(tour.future_events_list).to eq([event_2, event_3])
    end

    it "#past_events_list" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2018-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2021-02-11 21:10:51" )

      expect(tour.past_events_list).to be_a(Array)
      expect(tour.past_events_list).to eq([event_1, event_2])
    end

    it "#past_events?" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2018-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2015-02-11 21:10:51" )

      tour_2 = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour_2.id, show_date: "2022-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour_2.id, show_date: "2023-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour_2.id, show_date: "2025-02-11 21:10:51" )

      expect(tour.past_events?).to eq(true)
      expect(tour_2.past_events?).to eq(false)
    end

    it "#future_events?" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2018-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2015-02-11 21:10:51" )

      tour_2 = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour_2.id, show_date: "2022-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour_2.id, show_date: "2023-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour_2.id, show_date: "2025-02-11 21:10:51" )

      expect(tour.future_events?).to eq(false)
      expect(tour_2.future_events?).to eq(true)
    end

    it "#tour_start_date" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, name: "first", tour_id: tour.id, show_date: "2017-01-11 21:10:51" )
      event_2 = create(:event, name: "second", tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_3 = create(:event, name: "third", tour_id: tour.id, show_date: "2017-03-11 21:10:51" )

      expect(tour.start_date).to eq(event_1.show_date)
    end

    it "#tour_end_date" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, name: "first", tour_id: tour.id, show_date: "2017-01-11 21:10:51" )
      event_2 = create(:event, name: "second", tour_id: tour.id, show_date: "2017-02-11 21:10:51" )
      event_3 = create(:event, name: "third", tour_id: tour.id, show_date: "2017-03-11 21:10:51" )

      expect(tour.end_date).to eq(event_3.show_date)
    end
  end
end
