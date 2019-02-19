class Tour < ApplicationRecord
  validates_presence_of :name
  belongs_to :artist
  has_many :events

  def future_events_list
    events.map do |event|
      if event.show_date > Time.now
        event
      end
    end.compact
  end

  def past_events_list
    events.map do |event|
      if event.show_date < Time.now
        event
      end
    end.compact
  end

  def past_events?
    if past_events_list.count != 0
      true
    else
      false
    end
  end

  def future_events?
    if future_events_list.count != 0
      true
    else
      false
    end
  end
end
