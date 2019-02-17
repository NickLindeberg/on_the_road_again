class Event < ApplicationRecord
  validates_presence_of :name, :show_time
  belongs_to :tour

  def self.future_events
    now = Time.now.strftime("%m-%d-%Y")
    x = Event.where("show_date > ?", now)
  end

   def self.past_events
    now = Time.now.strftime("%m-%d-%Y")
    y = Event.where("show_date < ?", now)
  end

  def total_profit
    total = (self.event_profit - self.travel_cost)
    total
  end
end
