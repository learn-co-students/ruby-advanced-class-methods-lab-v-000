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
    self.all << song # Not sure which is better?
    #song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    #self.all.select {|song| song.name == name}[0]
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name) # Should return nil if song doesn't exist yet
    return song if song # Return the matching song if it already exists
    self.create_by_name(name) # Create and return song if it doesn't already exist
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed_data = filename.split(/ - |.mp3/)
    artist_name = parsed_data[0]
    song_name = parsed_data[1]

    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parsed_data = filename.split(/ - |.mp3/)
    artist_name = parsed_data[0]
    song_name = parsed_data[1]

    song = self.find_or_create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
