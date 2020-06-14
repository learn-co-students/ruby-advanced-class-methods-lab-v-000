require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.detect {|sn| sn.name == name}
  end

  def self.find_or_create_by_name(name)
    name_exists=""
    name_exists = self.find_by_name(name)
    if !name_exists
      song= self.create_by_name(name)
    else 
      song = name_exists
    end
    song
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name<=>b.name }
  end

  def self.parse_file_name(name)
    parsed_file= name.scan(/(^\w+)\s[-]\s([^\.]+)(\..+)/)
    song_name = parsed_file[0][1]
  end

    def self.parse_artist_from_file_name(name)
    parsed_file= name.scan(/(^\w+)\s[-]\s([^\.]+)(\..+)/)
    artist_name = parsed_file[0][0]
  end

  def self.new_from_filename(name)
    song = self.new
    song.name = self.parse_file_name(name)
    song.artist_name= self.parse_artist_from_file_name(name)
    song
  end


  def self.create_from_filename(name)
    song= new_from_filename(name)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
