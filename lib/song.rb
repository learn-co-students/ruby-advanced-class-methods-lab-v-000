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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_song = create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    to_find = find_by_name(name)
    to_create = create_by_name(name)
    to_find ? to_find : to_create
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    song = Song.new
    properties = filename.split(/[.-]/).map(&:strip)
    song.name = properties[1]
    song.artist_name = properties[0]
    song
  end

  def self.create_from_filename(filename)
    new_song = create
    properties = filename.split(/[.-]/).map(&:strip)
    new_song.name = properties[1]
    new_song.artist_name = properties[0]
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
