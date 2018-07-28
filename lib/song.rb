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
    #create a new song instance
    song_instance = self.new

    #save song
    song_instance.save

    #return new song that was created
    song_instance
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ||= self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = filename.chomp(".mp3")
    new_song_array = new_song.split(" - ")

    artist_name = new_song_array[0]
    song_name = new_song_array[1]

    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_song = filename.chomp(".mp3")
    new_song_array = new_song.split(" - ")

    artist_name = new_song_array[0]
    song_name = new_song_array[1]

    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
