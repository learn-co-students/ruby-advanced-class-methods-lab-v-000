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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(new_name)
    song = self.create
    song.name = new_name
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(song_file)
    artist_and_name = song_file.split (/[-\.]/)
    artist = artist_and_name[0].strip
    song_name = artist_and_name[1].strip

    song = self.new
    song.name =song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_file)
    artist_and_name = song_file.split (/[-\.]/)
    artist = artist_and_name[0].strip
    song_name = artist_and_name[1].strip

    song = self.create
    song.name =song_name
    song.artist_name = artist
    song
  end

def self.destroy_all
  @@all.clear
end


end
