require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:show_time) }
  end

  describe 'Relationship' do
    it { should belong_to(:tour) }
  end
end
