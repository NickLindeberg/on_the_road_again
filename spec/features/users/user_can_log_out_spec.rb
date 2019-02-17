require 'rails_helper'

describe 'Artist can logout' do
  it 'is redirected to welcome page' do
    artist = create(:artist)
    allow_any_instance_of(ApplicationController).to receive(:current_artist).and_return(artist)
    visit dashboard_path
    click_on "Log Out"
    expect(current_path).to eq(root_path)
  end
end
