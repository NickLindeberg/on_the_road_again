require 'rails_helper'

describe 'visitor can see nav bar' do
  it 'shows link to home and link to about page' do
    visit '/'

    expect(page).to have_content("On The Road Again")
    expect(page).to have_link("About")
    click_link "About"

    expect(current_path).to eq('/about')

    click_link "On The Road Again"

    expect(current_path).to eq('/')
  end
end
