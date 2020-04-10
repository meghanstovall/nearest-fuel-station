class SearchFacade

  def initialize(location)
    location = Location.new(location)
    station = StationFacade.new(location)
    # @station = NRELService.conn(location)
    # @directions = GoogleService.conn(location, @station)
  end

  def name
    @station[:station_name]
  end

  def address
    @station[:street_address]
  end

  def fuel_type
    @station[:fuel_type_code]
  end

  def access_times
    @station[:access_days_time]
  end

  def distance
    @directions[:distance][:text]
  end

  def duration
    @directions[:duration][:text]
  end

  def instructions
    @directions[:steps][0][:html_instructions]
  end
end
