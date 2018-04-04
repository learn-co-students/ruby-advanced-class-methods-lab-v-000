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
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

    def self.new_from_filename(filename)
      parts = filename.split(" - ")
      song = self.new
      song.artist_name = parts[0]
      song.name = parts[1].gsub(".mp3", "")
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
