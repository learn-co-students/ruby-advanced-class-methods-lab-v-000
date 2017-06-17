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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil
      song = Song.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by! { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split("-")
    artist = filename_arr[0].rstrip
    name = filename_arr[1][0..filename_arr[1].length - 5].lstrip
    song = new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
