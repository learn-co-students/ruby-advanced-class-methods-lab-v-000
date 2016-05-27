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
    song = self.new #Song.new
    song.save #self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  # Class Finder
  def self.find_by_name(name)
      self.all.detect do |song|
          song.name == name
      end
      #returns song instance that matches the name
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename.slice!('.mp3') #remove '.mp3' from filename
    parse_filename = filename.split('-').collect(&:strip)
    artist_name = parse_filename[0]
    name = parse_filename[1]

    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
