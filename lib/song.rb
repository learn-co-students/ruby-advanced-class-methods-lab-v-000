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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      song = self.find_by_name(name)
    else
      song = self.create_by_name(name)
    end
   song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file_data = filename.split(/[-.]/)
    song_name = file_data[1].strip
    artist = file_data[0].strip
    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    file_data = filename.split(/[-.]/)
    song_name = file_data[1].strip
    artist = file_data[0].strip
    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
