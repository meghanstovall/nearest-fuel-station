class SearchController < ApplicationController
  def index
    location = Location.new(params[:location])
    # address = params[:location].split(",")
    # street = address[0][5..-7]
    # city = address[1][1..-1]
    # state = address[-1][1..2]
    # zip = address[-1][4..-1]

    station_response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{street},#{city},#{state},#{zip}&api_key=#{ENV['NREL_API_KEY']}")
    json = JSON.parse(station_response.body, symbolize_names: true)
    @station = json[:fuel_stations].first


    directions_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{street}+#{city}+#{state}&destination=#{@station[:street_address]}+#{@station[:city]}+#{@station[:state]}&key=#{ENV['GOOGLE_API_KEY']}")
    json = JSON.parse(directions_response.body, symbolize_names: true)
    @directions = json[:routes][0][:legs][0]
  end
end
