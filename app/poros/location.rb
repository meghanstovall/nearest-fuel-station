class Location

  def initialize(address)
    @address = address.split(" ")
    require "pry"; binding.pry
  end

  def street
    @address[0..2]
  end
end
