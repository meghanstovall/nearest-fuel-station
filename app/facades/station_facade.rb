class StationFacade

  def initialize(location)
    @station = NRELService.conn(location)
  end

  def name
    @station[:station_name]
  end

  def address
    @station[:street_address]
  end

  def city
    @station[:city]
  end

  def state
    @station[:state]
  end

  def fuel_type
    @station[:fuel_type_code]
  end

  def access_times
    @station[:access_days_time]
  end
end
