class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create()
    song = self.new()
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
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      Song.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|title| title.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    title_tag = data[1]
    title_tag_data = title_tag.split(".")
    title = title_tag_data[0]
    #make the new song
    song = self.new
    #set the properties
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
