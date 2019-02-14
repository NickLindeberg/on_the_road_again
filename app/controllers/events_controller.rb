class EventsController < ApplicationController

  def new
    @tour = current_artist.tours.find_by(params[:id])
    @events = @tour.events.new

  end

  def create
    require "pry"; binding.pry

    redirect_to dashboard_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :show_time, :venue_id)
  end

end
