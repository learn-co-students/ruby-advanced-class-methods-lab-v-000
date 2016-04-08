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
    self.all << @song
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
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    data = filename_array.collect do |element|
      element.chomp(".mp3")
    end

    artist_name = data[0]
    name = data[1]

    song = self.new
    song.artist_name = artist_name
    song.name = name

    song
  end

  def self.create_from_filename(filename)
    (self.new_from_filename(filename)).save
  end

  def self.destroy_all
    self.all.clear
  end
end
