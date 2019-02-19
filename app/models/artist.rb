class Artist < ApplicationRecord
  validates_presence_of :name, :google_token, :email, :google_client_id
  has_many :tours
  has_many :events, through: :tours

  def self.find_or_create_from_auth_hash(auth)
    artist = find_or_create_by(google_client_id: auth["uid"])
  	artist.name = auth["info"]["first_name"]
  	artist.email = auth["info"]["email"]
    artist.google_token = auth["credentials"]["token"]
  	artist.save
    artist
  end

  def future_tours
    tours.map do |tour|
      if tour.future_events? == true
        tour
      end
    end.compact
  end

  def past_tours
    tours.map do |tour|
      if tour.past_events? == true
        tour
      end
    end.compact
  end
end
