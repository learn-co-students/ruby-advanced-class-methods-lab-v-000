require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create

    song = self.new
      @@all << song
        song
  end

  def self.new_by_name(name)
    song = self.new
     song.name = name
      song
   end

   def self.create_by_name(name)
    song = self.new
      song.name = name
      @@all << song
        song
   end

   def self.find_by_name(name)
    @@all.detect do |x|
         x.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |x| x.name
    end
  end

  def self.new_from_filename(filename)
    a =  filename.split("-").map do |x| x.chomp(".mp3").strip
    end

      song = self.create_by_name(a[1])
        song.artist_name = a[0]
        song
    end

    def self.create_from_filename(filename)
      a =  filename.split("-").map do |x| x.chomp(".mp3").strip
        end

          song = self.create_by_name(a[1])
            song.artist_name = a[0]
            @@all << song
              song
    end

  def self.destroy_all
    @@all.clear

  end


end
