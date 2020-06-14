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
    self.all.detect {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      name
    else
      self.new_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_details) #ex. song_details = "Juana Molina - A00 B01.mp3"
    artist_and_song_name = song_details.split(" - ") #account for space before/after dash so result is ["Juana Molina", "A00 B01.mp3"]
    artist_name = artist_and_song_name[0] #artist_name = "Juana Molina"
    song_name = artist_and_song_name[1].chomp(".mp3") #remove .mp3 by chomping, so song_name = "A00 B01"
    song = self.new #initialize the song
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_details)
    artist_and_song_name = song_details.split(" - ") #account for space before/after dash so result is ["Juana Molina", "A00 B01.mp3"]
    artist_name = artist_and_song_name[0] #artist_name = "Juana Molina"
    song_name = artist_and_song_name[1].chomp(".mp3") #remove .mp3 by chomping, so song_name = "A00 B01"
    song = self.new #initialize the song
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end
end
