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
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
      new_song = self.new
      new_song.name = name
      new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    return @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ") #["artist" "name.mp3"]
    song_title_w_mp3 = song_info[1].split(".mp3")
    song_title = song_title_w_mp3[0]
    new_song = self.new_by_name(song_title)
    new_song.artist_name = song_info[0]
    new_song
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ") #["artist" "name.mp3"]
    song_title_w_mp3 = song_info[1].split(".mp3")
    song_title = song_title_w_mp3[0]
    new_song = self.create_by_name(song_title)
    new_song.artist_name = song_info[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
  
end
