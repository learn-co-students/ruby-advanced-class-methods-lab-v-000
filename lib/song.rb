require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @name = name
    @artist_name = artist_name
    self.class.all << self
  end

  def self.create
    song_variable = self.new
    #@@all << song
    song_variable.save
    song_variable
  end
  
  def self.new_by_name(song_name)
    song_variable = self.new
    song_variable.name = song_name
    song_variable
  end
  
  def self.create_by_name(song_name)
    song_variable = self.new
    song_variable.name = song_name
    song_variable.save
    song_variable
  end
  
  def name=(song_name)
    @name = song_name
  end
  
  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) 
      self.find_by_name(song_name)
    else
        self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name} 
  end

  def self.new_from_filename(mp3_data)
    data = mp3_data.split(" - ")
    artist = data[0]
    title = data[1]
    song = self.new #self refers to the Song class.
    # Set the properies on the song.
    song.artist_name = artist
    song.name = title[0, title.length - 4]
    # return the song to collect
    song
  end

  def self.create_from_filename(mp3_data)
    self.all << self.new_from_filename(mp3_data)
  end

  def self.destroy_all
    self.all.clear
  end

end

  # song_1 = Song.create_by_name("Thriller")
  # song_2 = Song.create_by_name("Blank Space")
  # song_3 = Song.create_by_name("Call Me Maybe")
  
  # puts song_1 
  # puts song_1.name # => "Thriller"

  # puts Song.all

  # puts Song.alphabetical

