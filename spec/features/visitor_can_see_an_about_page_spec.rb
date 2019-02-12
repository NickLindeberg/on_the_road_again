require 'rails_helper'

describe 'about page' do
  it 'shows links to group repos and songkick' do
    visit '/about'

    expect(page).to have_link("Jimmy Smith")
    expect(page).to have_link("Nick Lindeberg")
    expect(page).to have_link("Silvestre Cuellar")
    expect(page).to have_link("Project Repo")
    expect(page).to have_link("Songkick")
  end
end
