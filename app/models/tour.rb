class Tour < ApplicationRecord
  validates_presence_of :name
  belongs_to :artist
  has_many :events
end
