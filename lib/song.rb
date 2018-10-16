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
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
    artist = song_data[0]
    song_name = song_data[1].gsub(".mp3", "")
    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(filename)
    song_data = filename.split(" - ")
    artist = song_data[0]
    song_name = song_data[1].gsub(".mp3", "")
    song = self.create_by_name(song_name)
    song.artist_name = artist
  end
  
  def self.destroy_all
    @@all.clear
    @@all
  end
end
