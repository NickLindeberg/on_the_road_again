class Venue

  attr_reader :name, :address, :city, :state, :website, :phone, :zip, :lat, :lng, :songkick_id, :capacity

  def initialize(venue_data)
    @name = venue_data[:displayName]
    @address = venue_data[:street]
    @city = venue_data[:city][:displayName]
    @state = venue_data[:city][:state][:displayName]
    @website = venue_data[:website]
    @phone = venue_data[:phone]
    @zip = venue_data[:zip]
    @lat = venue_data[:lat]
    @lng = venue_data[:lng]
    @songkick_id = venue_data[:id]
    @capacity = venue_data[:capacity]
  end
end
