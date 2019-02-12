class Artist < ApplicationRecord
  validates_presence_of :name, :token, :email, :google_client_id, :refresh_token

end
