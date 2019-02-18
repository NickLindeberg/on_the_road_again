class ArtistsController < ApplicationController

  def show
    @current_artist = current_artist
    # @future_tours = future_tours
    # @past_tours = past_tours
    # binding.pry
    if @current_artist
    else
      redirect_to '/'
    end
  end

  def edit
    @current_artist = current_artist
  end

  def update
    current_artist.band_name = params[:artist][:band_name]
    current_artist.save
    redirect_to dashboard_path
  end

  private

  # def future_tours
  #   current_artist.tours.map do |tour|
  #     binding.pry
  #     if tour.future_events? == true
  #       tour
  #     end
  #   end
  # end
  #
  # def past_tours
  #   current_artist.tours.map do |tour|
  #     if tour.past_events? == true
  #       tour
  #     end
  #   end
  # end
end
