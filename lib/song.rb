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
    song = self.new
    song.save
    song
 end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end


  def self.find_by_name(song_name)
    self.all.detect do |instance|
      instance.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else self.find_by_name(song_name)   
  end
end

=begin
def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
=end


  def self.alphabetical
    self.all.sort_by{|instance| instance.name}
  end

  def self.new_from_filename(file_name)
    name_array = file_name.split(/\s-\s|\./)
    song = self.create_by_name(name_array[1])
    song.artist_name = name_array[0]
    song
  end

=begin
    def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
=end


  def self.create_from_filename(file_name)
    name_array = file_name.split(/\s-\s|\./)
    song = self.create_by_name(name_array[1])
    song.artist_name = name_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end







