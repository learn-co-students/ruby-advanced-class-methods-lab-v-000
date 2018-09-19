require 'pry'


class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
    #binding.pry
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
    #binding.pry
  end

  def self.find_by_name(name)

    if @@all.empty? == false
      @@all.each do |song|
        if song.name == name
          #binding.pry
          return song
        end
      end
    end
      #binding.pry
    nil

  end


  def self.find_or_create_by_name(name)
    #binding.pry
=begin
    @@all.each do |song|
      #binding.pry
      if song.name == name
        return self.find_by_name(name)
      end
    end
    self.create_by_name(name)
    #binding.pry
=end

=begin
    if self.find_by_name(name) == false
      create_by_name(name)
    end
    self.find_by_name(name)
=end
  self.find_by_name(name) || self.create_by_name(name)

  end


=begin
  def self.find_or_create_by_name(name)

    #binding.pry

    @@all.each do |song|
      #binding.pry
      if song.name == name
        return self.find_by_name(name)
      end
    end

    self.create_by_name(name)
    #binding.pry

  end
=end 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
