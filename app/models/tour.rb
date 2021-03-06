class Tour < ApplicationRecord
  validates_presence_of :name
  belongs_to :artist
  has_many :events, dependent: :destroy

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

  def start_date
    first_event = Event.order('show_date ASC').first
    if first_event
      first_event.show_date
    end
  end

  def end_date
    first_event = Event.order('show_date DESC').first
    if first_event
      first_event.show_date
    end
  end
end
