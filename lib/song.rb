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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_by_name = self.new
    new_by_name.name = name
    new_by_name
  end

   def self.create_by_name(name)
     created_by_name = self.new
     created_by_name.name = name
     created_by_name.save
     created_by_name
   end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    sorted_songs = []
    self.all.each do |song|
      sorted_songs << song
    end
    sorted_songs.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data [0].chomp(" ")
    name = data[1].strip

    song = self.new
    song.name = name.chomp(".mp3")
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data [0].chomp(" ")
    name = data[1].strip

    song_from_file = self.new
    song_from_file.name = name.chomp(".mp3")
    song_from_file.artist_name = artist_name
    song_from_file.save
    song_from_file
  end

  def self.destroy_all
    self.all.clear
  end
end
