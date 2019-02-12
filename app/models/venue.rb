class Venue < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :website, :phone, :zip, :lat, :lng, :songkick_id, :capacity

  has_many :events
end
