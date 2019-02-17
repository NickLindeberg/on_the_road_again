class Event < ApplicationRecord
  validates_presence_of :name, :show_time
  belongs_to :tour

  def total_profit
    total_prof = self.event_profit - self.travel_cost
    total_prof
  end
end
