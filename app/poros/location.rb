class Location

  def initialize(address)
    @address = address.split(" ")
  end

  def street
    @address[0..2].join(" ")
  end

  def city
    @address[-3][0...-1]
  end

  def state
    @address[-2]
  end

  def zip
    @address[-1]
  end
end
