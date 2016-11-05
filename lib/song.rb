class Song

  attr_accessor :name, :artist_name

  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song.save
    song
  end

  def self.find_by_name(input_name)
    @@all.each do |song|
      if song.name == input_name
        return song
      end
    end
  end

  def self.find_or_create_by_name(input_name)
    unless self.find_by_name(input_name) == false
      self.create_by_name(input_name)
    end
  end

  def self.alphabetical
    @@all.uniq.sort_by {|element| element.name}
  end

  def self.new_from_filename(filename)
    filename = filename[0...(filename.length-4)]
    array = filename.split(" - ")
    song = Song.new
    song.artist_name = array[0]
    song.name = array[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
