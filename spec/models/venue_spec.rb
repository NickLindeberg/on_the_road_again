require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:website) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:capacity) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
    it { should validate_presence_of(:songkick_id) }
  end

  xdescribe 'Relationship' do
    it { should have_many(:events)}
  end
end
