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
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    search = self.find_by_name(song_name)
    if search == nil
      self.create_by_name(song_name)
    else
      search
    end
  end

  def self.alphabetical
    newlySortedArray = self.all.sort! { |a, b| a.name.downcase <=> b.name.downcase}
  end

  def self.new_from_filename(file_name)
    splitArray = file_name.split(" - ")
    artist_name = splitArray[0]
    song_name = splitArray[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    splitArray = file_name.split(" - ")
    artist_name = splitArray[0]
    song_name = splitArray[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
