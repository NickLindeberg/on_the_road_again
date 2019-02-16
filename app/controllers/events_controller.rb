class EventsController < ApplicationController

  def new
    @tour = current_artist.tours.find_by(params[:id])
    @events = @tour.events.new
    service = VenueBuilderFacade.new
    @venues = service.find_venues_by_city(params[:q])
  end

  def create

  end

  private

  def event_params
    params.require(:event).permit(:name, :show_time, :venue_id)
  end

end

#
# <!-- <%= form_tag :events, method: :get, class: "form-inline" do %>
#   <div class="form-group search-field">
#     <%= text_field_tag :q, "", class: "form-control" %>
#     <%= submit_tag "Locate", class: "btn btn-primary" %>
#   </div>
# <% end %> -->
