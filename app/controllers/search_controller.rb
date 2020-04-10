class SearchController < ApplicationController
  def index
    location = Location.new(params[:location])

    @station = NRELService.conn(location)
    @directions = GoogleService.conn(location, @station)

  end
end
