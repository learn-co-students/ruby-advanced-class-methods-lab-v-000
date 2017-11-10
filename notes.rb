require 'Pry'
require 'nokogirl'
require 'open-url'

class Concert
  # what does a concert have? think of data as attributes, method objects have data is through instance variables.

  attr_accessor :venue, :name, :location
  # @@all = [] #=> Class Variables
  # ALL = [] #But that's a Class Constant - can make it here, but can never change it.
  #But Class Constant's create weird bugs called Leaky Inheritance.
  #In scope in class methods and instance methods
  #Class Scope

  # def venue
  #   @venue
  # end
  #
  # def venue=(venue)
  #   @venue = venue
  # end

  def self.create #Constructor -- it's going to wrap initialize with some other functionality.
    c = self.new # Instantiates a concert
    c.save #saves it or persists it
    c #returns it
    #This is a simple extension of initialize. Very simple constructor
  end

  def self.new_from_seatgeek(url) #Custom constructor that does something very smart - taking in info with scraping from seatgeek
    doc = Nokogirl::HTML(open(url)) #This is Scraping - don't get confused by it as not taught it yet.
    properties = {}
    properties[:name] = doc.search("#event-title").text
    properties[:venue] = doc.search(".event-detail-words").text.split(" - ").first #--> not split correctly.
    self.new_from_hash(properties)
  end
  # Concert.new_from_hash({:venue => "MSG", :name => "Kanye"})

  def self.new_from_hash(hash) #Constructor
    c = self.new
    c.name = hash[:name]
    c.venue = hash[:venue]
    c.location = hash[:location]
    c
  end

  def initialize #Class Method or Instance Method? It's an instance method because the reciever is an instance
    #Instance Scope
    # self #=> good key to what scope you're in. #<Concert>
    # @@all << self #The particular concert's copy of @all -- taken out and put into save
    #want to extend initialize, in the event that want to create a concert without saving it, then can do it. (Called a constructor)
  end

  # def self.destroy_all!
  #   ALL.clear
  # end

  # def over? #Methods by default in the class body become instance methods.
  #   Time.now - self.date <= 0 #self is a particular concert
  # end

  def save
    @@all << self #The particular concert's copy of @all
  end


  def self.find_all_by_location(location)
    @@all.select{|c| c.location == location}
  end


  # Concert.find_by_location("Hogwarts") #=> [] want it to return empty array, and maintain its usage.
  # Concert.find_all_by_location("NYC") #=> [#<>, #<>]
  def self.find_by_location(location) #self is the Concert (the class itself) Building a Class finder -> finds data.
    #Where do I look for concerts?
    #Wherever I'm looking for concerts, how do concerts get there?
    #Whose responsibility is it to keep track concerts?
    #What's my scope? Class Scope



    #I need to go through @@all and find the concert whose location matches
    #the location passed into this method.
    #Find the first concert whose location is the location passed in.
    #Very abstract
    @@all.detect{|c| c.location == location}


    #Very not abstract
    #first, I need to create a variable that is the result

    # result = nil #Flag or a Switch - Maintaining State.
    #
    #
    # #counter = nil
    # #do Something that will set result to the correct concert.
    # #But don't want to return in a loop, because it's lazy. Just don't use return keyword inside of a loop.
    # @@all.each do |concert| #start a loop
    #   #abort the entire method and return concert.
    #   result = concert if concert.location == location
    # end #=> All Concerts [#<>, #<>]
    #
    # #return result
    # #by the end of this method I know result must be matching concert.
    #
    # result #=> nil or a particular concert.

  end


  # def Concert.find_by_location(location) #shunned upon, be more abstract. always self.
  # end

  def self.all #Becomes Class Reader
    #Class Scope
    @all #Belongs to the Instance -- The classes copy of @all.
    #Where do I look for concerts?
    #Wherever I'm looking for concerts, how do concerts get there?
    #Whose responsibility is it to keep track concerts?
  end
end

kanye_listening_party = Concert.new #A new concert was scheduled
kanye_listening_party.venue=("MSG")
kanye_listening_party.location = "NYC" #=> An instance of a concert
binding.pry

Concert.find_by_location("NYC") #=> [#<Concert>, #<Concert>] What we want to have.
# writing code I wish I had.

# 1. Whose responsibility is it to find all concerts in NYC?
#=> An individual concert, like kanye_listening_party,
#=> or is it Concert's in general? It's the classes responsibility
#=> So how do specify that you're going to call .find_by_location on the class and not on the instance?
