class Artist < ApplicationRecord
  validates_presence_of :name, :google_token, :email, :google_client_id
  has_many :tours

  def self.find_or_create_from_auth_hash(auth)
    artist = find_or_create_by(google_client_id: auth["uid"])
  	artist.name = auth["info"]["first_name"]
  	artist.email = auth["info"]["email"]
    artist.google_token = auth["credentials"]["token"]
  	artist.save
    artist
  end
end
