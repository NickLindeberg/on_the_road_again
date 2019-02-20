require 'rails_helper'

describe "Venue" do
  it 'exists' do
    data = {:lng=>-104.9953172,
           :street=>"1902 Blake St.",
           :zip=>"80202",
           :website=>"http://www.sodajerkpresents.com",
           :description=>"",
           :phone=>"123-525-1232",
           :displayName=>"Summit Music Hall",
           :metroArea=>{:displayName=>"Denver", :uri=>"http://www.songkick.com/metro_areas/6404-us-denver?utm_source=55502&utm_medium=partner", :id=>6404, :state=>{:displayName=>"CO"}, :country=>{:displayName=>"US"}},
           :capacity=>12,
           :city=>{:displayName=>"Denver", :uri=>"http://www.songkick.com/metro_areas/6404-us-denver?utm_source=55502&utm_medium=partner", :id=>6404, :state=>{:displayName=>"CO"}, :country=>{:displayName=>"US"}},
           :uri=>"http://www.songkick.com/venues/836146-summit-music-hall?utm_source=55502&utm_medium=partner",
           :id=>836146,
           :lat=>39.7535064}

    venue = Venue.new(data)
    expect(venue).to be_a(Venue)
    expect(venue.name).to eq("Summit Music Hall")
    expect(venue.address).to eq("1902 Blake St.")
    expect(venue.city).to eq("Denver")
    expect(venue.website).to eq("http://www.sodajerkpresents.com")
    expect(venue.phone).to eq("123-525-1232")
    expect(venue.zip).to eq("80202")
    expect(venue.lat).to eq(39.7535064)
    expect(venue.lng).to eq(-104.9953172)
    expect(venue.songkick_id).to eq(836146)
    expect(venue.capacity).to eq(12)
  end
end
