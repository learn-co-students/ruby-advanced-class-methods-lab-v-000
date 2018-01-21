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

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        song.name
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by! {|word| word.name}
  end

  def self.new_from_filename(name)
    array = name.split(" - ")
    artist = array[0]
    song_name = array[1]
    song = self.new
    song.name = song_name.chomp(".mp3")
    song.artist_name = artist
    song
  end

  def self.create_from_filename(name)
    array = name.split(" - ")
    artist = array[0]
    song_name = array[1]
    song = self.create
    song.name = song_name.chomp(".mp3")
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
