require 'rails_helper'

RSpec.describe Tour, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Relationship' do
    it { should belong_to(:artist)}
    it { should have_many(:events)}
  end
end
