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

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name (name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (file_name)
    song = self.new
    file_name = file_name.split(/[.,-]/) #splitting using regex, then first and second would artist and name respectively.
    song.artist_name = file_name[0].strip
    song.name = file_name[1].strip
    song
  end

  def self.create_from_filename (file_name)
    song = self.create
    file_name = file_name.split(/[.,-]/) #splitting using regex, then first and second would artist and name respectively.
    song.artist_name = file_name[0].strip
    song.name = file_name[1].strip
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
