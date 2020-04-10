class NRELService

  def self.conn(location)
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{location.street},#{location.city},#{location.state},#{location.zip}&api_key=#{ENV['NREL_API_KEY']}")
    get_data(JSON.parse(response.body, symbolize_names: true))
  end

  private
    def self.get_data(json)
      station = json[:fuel_stations].first
    end
end
