class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(input_name)
    song = Song.new
    song.name = input_name
    return song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    return song
  end

  def self.new_from_filename(filename)
    song = Song.new
    parts = filename.split(" - ")
    parts[1].chomp!(".mp3")
    song.name = parts[1]
    song.artist_name = parts[0]
    return song
  end

  def self.create_from_filename(filename)
    song = Song.create
    parts = filename.split(" - ")
    parts[1].chomp!(".mp3")
    song.name = parts[1]
    song.artist_name = parts[0]
    return song
  end

  def self.find_by_name(search_name)
    @@all.detect{|song| song.name==search_name}
  end

  def self.find_or_create_by_name(search_name)
    song = Song.find_by_name(search_name)
    if (song==nil)
      song = Song.create_by_name(name)
    end
    return song
  end

  def self.alphabetical
    @@all.sort!{|prev, curr| prev.name <=> curr.name}
    return @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
