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

  def self.new_by_name(name_string)
    song = self.new
    song.name = name_string
    song
  end

  def self.create_by_name(name_string)
    song = self.new_by_name(name_string)
    song.save
    song
  end

  def self.find_by_name(name_string)
    self.all.detect {|found_song| found_song.name == name_string}
  end

  def self.find_or_create_by_name(name_string)
    if self.find_by_name(name_string) #!= nil
      self.find_by_name(name_string)
    else self.create_by_name(name_string)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(/[^a-zA-Z\s]|\s-\s/)[1]
    song.artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(/[^a-zA-Z\s]|\s-\s/)[1]
    song.artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
