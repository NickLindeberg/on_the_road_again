require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:token) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:google_client_id) }
    it { should validate_presence_of(:refresh_token) }
  end

  describe 'Relationship' do
    it { should have_many(:) }
  end

  # it "checks role of instance of user" do
  #   default = User.create!(first_name: "def", last_name: "plugs", street_address: '123 fake st', email_address: 'fake@gmail.com', password: "12345", city: "Nowhere", zip:18333, state: "NH", role: 0)
  #   merchant = User.create!(first_name: "merch", last_name: "plugs", street_address: '123 sell fake st', email_address: 'merchant@pubshop.com', password: "12345", city: "Nowhere", zip:18333, state: "NH", role: 1)
  #   admin = User.create!(first_name: "admin", last_name: "plugs", street_address: '123 big fake st', email_address: 'admin@pubshop.com', password: "12345", city: "Nowhere", zip:18333, state: "NH", role: 2)
  #
  #   expect(default.role).to eq("default")
  #   expect(merchant.role).to eq("merchant")
  #   expect(admin.role).to eq("admin")
  # end

end
