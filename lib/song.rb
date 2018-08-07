require 'pry'
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
    song = Song.new
    song.save
    song
  end
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end
  def self.create_by_name(name_of_song)
    song = Song.new
    song.name = name_of_song
    song.save
    song
  end
  def self.find_by_name(find_it)
    song = @@all.find{|song| song.name == find_it}
    song
  end
  def self.find_or_create_by_name(name)
   found = self.find_by_name(name)
   created = self.create_by_name(name)
    if found
      return found
     else 
       return created
  end
  end 
  def self.alphabetical
    @@all.sort_by do |song_object|
      song_object.name
    end
  end
  def self.new_from_filename(song_object)
    song = self.new
    song_parts = song_object.split(" - ")
    artist_name = song_parts[0]
    song_name = song_parts[1].gsub(".mp3", "")
    song.name = song_name
    song.artist_name = artist_name
  end
end
