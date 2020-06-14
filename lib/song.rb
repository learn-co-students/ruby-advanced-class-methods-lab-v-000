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
    song = self.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do |song_name|
      if song_name.name == name
        name
      else
        false
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) unless find_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new_by_name(filename.split(" - ")[1].split(".")[0])
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_by_name(filename.split(" - ")[1].split(".")[0])
    song.artist_name = filename.split(" - ")[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end




end
