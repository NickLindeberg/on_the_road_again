class Artist < ApplicationRecord
  validates_presence_of :name, :google_token, :email, :google_refresh_token
  has_many :tours

  # def self.from_omniauth(auth)
  #   where(email: auth.info.email).first_or_initialize do |artist|
  #     artist.name = auth.info.name
  #     artist.email = auth.info.email
  #   end
  # end
end
