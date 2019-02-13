require 'rails_helper'

describe "Venue Facade " do
  it "Facede can return venue data based on cities" do
    vfacade = VenueFacade.new("Denver")

    expect(vfacade).to be_a(VenueFacade)
  end 
end
