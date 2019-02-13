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
end
