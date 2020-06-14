class Concert
  attr_accessor :venue, :name, :date, :location
  @@all # class variable. In scope in class methods

  def initialize
    # in programing, know where you are, what your scope is.
    #in a class? class scope. #in a method-> instance method. Init is an instance method.scope
    self #is in the scope -- will refer to our newly-born conference. #=><Concert>
    @@all << self # @all <self would be a instance variable.
  end



#here, self is Concert. Class reader
  def self.find_all_by_location(location)

    @@all.select{|c| c.location ==location}
    # select all elements for which this equation is true.

=begin    Refactor thus:
    result = nil #set
    @@all.each do |concert|
      result = concert if concert.location = location
    end
    result #=>nil or concert we are setting the state with result, then maintaining it here.
  end

  #refactor: look at the documentation. scroll through, any possibilities jump out at you?
  # look at method names? all? read it.find one that works. this case? find_all, and play with it.
  # really explore the enumerable docs, with each, you have to write more code
  #find_all and select are syanums

  @@all.each do|concert|
      #result = nil # flag or switch -- it maintians state
      # do something that will set result to the right one
      # return results Also, rule of thumb, avoid using return -- don't
      # escape the loop with return
      #don't do it like this: @@all.each do |concert|
                #    return concert if concert.location = location
                #returning in a loop is lazy, because you short-circuit the method -- you
                # always need to know what a method actually returns. NO RETURN KEYWORD IN A LOOP.
=end
    end
  end
#2 Where do I look for concerts.
#"Only way to build a class method is by using self, and making it the explicit reciever"
# you could do this, but it's wrong, because greater abstraction is always better:   def Concert.find_by_location(location)
# 3. whereever I'm looking for concerts, how do they get there, and
#4. whose responsibility is it to find concerts in NYC.
  # assumption -- how do you find any concerts in NYC?

  def self.all
    #where do we find the concerts -- after concerts are born, where can we take note of this: kanye_listening_party = Concert.new -- save this. In initialize!!!
  end
end

#  def self.destroy_all!
#    All = [] -- class constant -- not supposed to change the value That's why we use @@all. You can do ALL.clear -- where you delete everyhting inside
#    @@all = [] #-> problem is "leeky inheritance" later

kanye_listening_party = Concert.new
kanye_listening_party.venue=("MSG")
kanye_listening_party.location = "NYC"
#this method venue= passed the argument into the property of venu


# this gets refactored into attr_accessor
  #def venue
  #  @venue  this is an instance reader -- the big one above reads @@all andis a class reader, reads the class variable

  #end

  #def venue=(venue)
  #  @venue = venue venue hoists the local variable into the class variable
  #end

=begin
How would we build this: Concert.find_by_location("NYC")#=>[#<concert>, #,concert>]
# this is what I would spec out if I were buildign the test -- this is what I want the method to return
# how to build it and all the steps

#1. Ask "what kind of method is this?" Whose responsibiity is it?
   => individual concerts
   => concerts in general?
#2 Where do I look for concerts.

end

kanye_listening_party = Concert.new
kanye_listening_party.venue=("MSG")
#this method venue= passed the argument into the property of venu

#before you hit enter on a line of code, take a moment to think about what
# it's going to do -- good habit, to see where you right, and see a new model.
