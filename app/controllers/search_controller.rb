class SearchController < ApplicationController
  def index
    location = Location.new(params[:location])

    @station = NRELService.conn(location)

    directions_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{location.street}+#{location.city}+#{location.state}&destination=#{@station[:street_address]}+#{@station[:city]}+#{@station[:state]}&key=#{ENV['GOOGLE_API_KEY']}")
    json = JSON.parse(directions_response.body, symbolize_names: true)
    @directions = json[:routes][0][:legs][0]
  end
end
