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

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
     song = self.new
     song.name = song_title
     song.save
     song
  end

  def self.find_by_name(song_title)
     @@all.detect{|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
      self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
     @@all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(filename)
     name_and_artist = filename.split(" - ")
     artist_name = name_and_artist[0]
     song_title = name_and_artist[1]
     song = self.new
     song.name = song_title.chomp('.mp3')
     song.artist_name = artist_name
     song
  end

  def self.create_from_filename(filename)
    name_and_artist = filename.split(" - ")
    artist_name = name_and_artist[0]
    song_title = name_and_artist[1]
    song = self.create
    song.name = song_title.chomp('.mp3')
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
  self.all.clear
  end
end
