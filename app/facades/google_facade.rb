class GoogleFacade

  def initialize(location, station)
    @directions = GoogleService.conn(location, station)
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
