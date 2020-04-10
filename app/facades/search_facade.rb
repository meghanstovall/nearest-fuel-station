class SearchFacade
  attr_reader :station, :directions

  def initialize(location)
    location = Location.new(location)
    @station = StationFacade.new(location)
    @directions = GoogleFacade.new(location, @station)
  end
end
