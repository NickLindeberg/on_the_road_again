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
    it "#future_tours" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2022-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2020-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2021-02-11 21:10:51" )

      tour_2 = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour_2.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour_2.id, show_date: "2016-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour_2.id, show_date: "2015-02-11 21:10:51" )

      expect(artist_1.future_tours).to be_a(Array)
      expect(artist_1.future_tours).to eq([tour])
    end

    it "#past_tours" do
      artist_1 = create(:artist)
      tour = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour.id, show_date: "2022-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour.id, show_date: "2020-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour.id, show_date: "2021-02-11 21:10:51" )

      tour_2 = create(:tour, artist_id: artist_1.id)
      event_1 = create(:event, tour_id: tour_2.id, show_date: "2017-02-11 21:10:51" )
      event_2 = create(:event, tour_id: tour_2.id, show_date: "2016-02-11 21:10:51" )
      event_3 = create(:event, tour_id: tour_2.id, show_date: "2015-02-11 21:10:51" )

      expect(artist_1.past_tours).to be_a(Array)
      expect(artist_1.past_tours).to eq([tour_2])
    end
  end
end
