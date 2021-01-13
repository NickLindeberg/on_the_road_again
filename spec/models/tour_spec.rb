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
    let(:artist)      { create(:artist) }
    let(:tour)        { create(:tour, artist_id: artist.id) }
    let(:tour_2)      { create(:tour, artist_id: artist.id) }
    let!(:event_1)    { create(:event, tour: tour, show_date: 12.days.ago) }
    let!(:event_2)    { create(:event, tour: tour, show_date: future_show) }
    let(:future_show) { 10.days.from_now }

    context 'event lists' do
      it "#past_events_list" do
        expect(tour.past_events_list).to be_a(Array)
        expect(tour.past_events_list).to eq([event_1])
      end

      it "#future_events_list" do
        expect(tour.future_events_list).to be_a(Array)
        expect(tour.future_events_list).to eq([event_2])
      end
    end

    context "past and future events" do
      let!(:event_2)  { create(:event, tour: tour_2, show_date: future_show) }

      it "#past_events?" do
        expect(tour.past_events?).to eq(true)
        expect(tour_2.past_events?).to eq(false)
      end

      it "#future_events?" do
        expect(tour.future_events?).to eq(false)
        expect(tour_2.future_events?).to eq(true)
      end
    end

    context "start and end dates" do
      it "#tour_start_date" do
        expect(tour.start_date).to eq(event_1.show_date)
      end

      it "#tour_end_date" do
        expect(tour.end_date).to eq(event_2.show_date)
      end
    end
  end
end
