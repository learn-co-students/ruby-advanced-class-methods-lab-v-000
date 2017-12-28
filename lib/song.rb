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
    @@all << song
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

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
        self.create_by_name(name)
    else
        self.find_by_name(name)
        end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    song = self.new
    song.artist_name = info[0]
    song.name = info[1][/[^.]+/]
    song
  end

  def self.create_from_filename(filename)
    info = filename.split(' - ')
    song = self.create
    song.name = info[1][/[^.]+/]
    song.artist_name = info[0]
  end

  def self.destroy_all
    @@all = []
  end
end
