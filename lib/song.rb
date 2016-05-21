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
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|entry| entry.name}
  end

  def self.new_from_filename(string)
    song_info = string.split(" - ") #["artist" "name"]
    song_title_mp3 = song_info[1].split(".mp3")
    song_title = song_title_mp3[0]
    new_song = self.new_by_name(song_title)
    new_song.artist_name = song_info[0]
    new_song
  end

  def self.create_from_filename(string)
    song_info = string.split(" - ") #["artist" "name"]
    song_title_mp3 = song_info[1].split(".mp3")
    song_title = song_title_mp3[0]
    new_song = self.create_by_name(song_title)
    new_song.artist_name = song_info[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end

# You have to build class methods that interact on the class data of @@all and
# provide the rest of our program with a semantic API
