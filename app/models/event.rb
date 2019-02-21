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

  def self.event_gains(tour)
    profit_totals = []
    z = Event.where(tour_id: tour)
    z.each do |e|
      profit_totals << e.event_profit
    end
    profit_totals.sum.to_f
  end

  def self.travel_cost(tour)
    travel_expenses = []
    y = Event.where(tour_id: tour)
    y.each do |e|
      travel_expenses << e.travel_cost
    end
    travel_expenses.sum.to_f
  end

  def artist?
    self.tour.artist
  end

  def total_profit
    total = (self.event_profit - self.travel_cost)
    total
  end
end
