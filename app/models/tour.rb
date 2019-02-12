class Tour < ApplicationRecord
  validates_presence_of :name
  belongs_to :artist
end
