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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
     end
   end


  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end


  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    new_song = Song.new
    new_song.name = array.pop.split(".mp3").join
    new_song.artist_name = array[0]
    new_song
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    new_song = Song.new
    new_song.name = array.pop.split(".mp3").join
    new_song.artist_name = array[0]
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
