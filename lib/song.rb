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

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(song_title)
    song = self.new
    song.name = song_title
    song.save
    song
  end

  def self.find_by_name(song_title) 
    self.all.detect { |song| song.name == song_title }
  end 

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by { |i| i.name }
  end

  def self.new_from_filename(song_title)
    input = song_title.split(/\s-\s|\./)
    song = self.new
    artist_name = input[0]
    title = input[1]
    song.name = title 
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    self.all.clear
  end

end
