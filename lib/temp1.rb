require 'pry'

class Song
 
    @@all = []
 
    attr_accessor :name
 
    def initialize(name)
        @name = name
        @@all << self
    end
 
    def self.all
        @@all.each do |song|
            puts song.name
        end
    end
end

my_girl = Song.new("My Girl")
boardwalk = Song.new("Under the boardwalk")
binding.pry