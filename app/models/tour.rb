class Tour < ApplicationRecord
  validates_presence_of :name
  belongs_to :artist
  has_many :events

  def future_events
    events.map do |event|
      if event.show_date > Time.now
        event
      end
    end.compact
  end

  def past_events
    events.map do |event|
      if event.show_date < Time.now
        event
      end
    end.compact
  end
end
