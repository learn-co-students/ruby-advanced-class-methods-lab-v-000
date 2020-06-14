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
    self.all.detect{|s|s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(name)
      #  binding.pry
      song = self.new

    # \.+mp3 regex checks for .mp3
    if name.match(/\.+mp3/) != nil
      rows = name.split(" - ")
      song.name = rows[1]

      rows[1].gsub!(/\.+mp3/, '')
      song.artist_name = rows[0]

      song

    end
  end
  def self.create_from_filename(name)
    song = self.new

    if name.match(/\.+mp3/) != nil
      rows = name.split(" - ")
      song.name = rows[1]

      rows[1].gsub!(/\.+mp3/, '')
      song.artist_name = rows[0]

      @@all << song
      song
    end

  end
  def self.destroy_all
    self.all.clear
  end


end
