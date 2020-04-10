class GoogleService

  def self.conn(start_location, end_location)
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{start_location.street}+#{start_location.city}+#{start_location.state}&destination=#{end_location.address}+#{end_location.city}+#{end_location.state}&key=#{ENV['GOOGLE_API_KEY']}")
    get_data(JSON.parse(response.body, symbolize_names: true))
  end

  private
    def self.get_data(json)
      directions = json[:routes][0][:legs][0]
    end
end
