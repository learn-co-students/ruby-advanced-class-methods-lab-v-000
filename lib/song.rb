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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
   song = self.new
   song.name = song_name
   song
 end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  # def self.new_from_filename(song_name)
  #   split_string = song_name.split(' - ')
  #   artist_name = split_string[0]
  #   song_name_w_file = split_string[1]
  #   song_name_split = song_name_w_file.split('.')
  #   song_name = song_name_split[0]
  #   self.create_by_name(song_name)
  #   self.artist_name = artist_name
  #   # artist_name_strip = song_name.match(/^[a-zA-Z0-9]+/) #extract the artist name --this is working
  #   # song_name_strip = song_name.match(//)
  #   # self.create_by_name(song_name_strip)
  #   # self.artist_name = artist_name
  # end

  def self.new_from_filename(filename)
    filename_parts = filename.split(' - ')
    artist = filename_parts[0]
    song_name = filename_parts[1].gsub(".mp3", "")
    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
