class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Custom constructor - #create
  def self.create
    @song = self.new
    @song.save
    @song #returning the song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.create.name = name
    @song
  end

  def self.find_by_name(name)
    self.all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name) == nil
    #   self.create_by_name(name)
    # else
    #   self.find_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |s| s.name }
  end

  def self.new_from_filename(filename)
    # filename_array = filename.split(" - ")
    # data = filename_array.collect do |element|
    #   element.chomp(".mp3")
    # end
    parts = filename.split(" - ")

    artist_name = parts[0]
    name = parts[1].gsub(".mp3", "")

    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    # (self.new_from_filename(filename)).save

    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
