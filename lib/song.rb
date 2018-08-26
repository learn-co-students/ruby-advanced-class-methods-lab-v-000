class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song = self.new
    self.all << song
    song
  end
  def self.all
    @@all
  end
  def save
    self.class.all << self
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    unless song = self.find_by_name(name)
      song = self.create_by_name(name)
    end
    song
  end
  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end
  def self.new_from_filename(filename)
    file_data = filename.split('-')
    artist = file_data[0].strip
    name = file_data[1].chomp(".mp3").strip
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end
  def self.destroy_all
    self.all.clear
  end
end
