class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
      end

  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    new_arr = @@all.sort_by! {|song| song.name}
    new_arr
  end

  def self.new_from_filename(file_name)
    new_arr = file_name.split(/\s\-\s|\./)
    song = self.new
    song.name = new_arr[1]
    song.artist_name = new_arr[0]
    song
  end

  def self.create_from_filename(file_name)
    new_arr = file_name.split(/\s\-\s|\./)
    song = self.new
    song.name = new_arr[1]
    song.artist_name = new_arr[0]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
