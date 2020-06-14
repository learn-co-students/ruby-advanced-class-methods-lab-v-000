class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    #closed for modification
  end


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
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    song_array = nil
    if self.find_by_name(song_name) == false
      return song_array
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song_name| song_name.name}
  end

  def self.new_from_filename(file_in_mp3_format)
    mp3_file = file_in_mp3_format.split("-")
    song_in_mp3_format = mp3_file[1]
    song_file = song_in_mp3_format.split(".")
    name = song_file[0].strip
    artist_name = mp3_file[0].strip

    song = self.new

    song.name = name
    song.artist_name = artist_name

    song
  end

  def self.create_from_filename(file_in_mp3_format)
    mp3_file = file_in_mp3_format.split("-")
    song_in_mp3_format = mp3_file[1]
    song_file = song_in_mp3_format.split(".")
    name = song_file[0].strip
    artist_name = mp3_file[0].strip

    song = self.new

    song.name = name
    song.artist_name = artist_name

    @@all << song
  end


  def self.destroy_all
    @@all.clear
  end

end
