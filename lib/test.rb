require 'pry'

class Concert
  attr_accessor :venue, :name, :date, :location
  @@all

  #constructor constructs an object -- wraps the initizize method.
  def self.create  #extend initialize with create
    c = self.new
    c.save
    c #like initialize but extends it with more functionality
  end

  def self.new_from_hash #constructor -- concert.new_from_hash and pass in hasgh of venue
    {:venue => "MSG", :name =>}
    c = self.new
    c.name = hash[:name]
    c.venue = hash[:venue]
    c.location = hash[:location]
  end

  def initialize
    self
    @@all << self
  end

  def self.find_by_location(location)
    @@all.select {|c| c = concert.location}
  end
#
  def self.all
    @@all
  end
end

kanye_listening_party = Concert.new
beyonce_in_june = Concert.new
