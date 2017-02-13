class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize

  end
  def self.create
    song = Song.new
    song.save
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == []
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename = filename.split(' - ')
    song_name = filename[1].split('.')
    song = self.find_or_create_by_name(song_name[0])
    song.artist_name = filename[0]
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
