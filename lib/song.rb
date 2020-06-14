class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist = filename.split(' - ')[0]
    song = filename.split(' - ')[1].split('.')[0]
    song_entry = self.new_by_name(song)
    song_entry.artist_name = artist
    song_entry
  end

  def self.create_from_filename(filename)
    artist = filename.split(' - ')[0]
    song = filename.split(' - ')[1].split('.')[0]
    song_entry = self.new_by_name(song)
    song_entry.artist_name = artist
    self.all << song_entry
    song_entry
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end #end of Song class
















