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
    self.all.detect { |n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |a| a.name }
  end

  def self.new_from_filename(filename)
    f = filename.split(/[.]\w+\z/).join
    f = f.split(" - ")
    artist_name = f[0]
    name = f[1]

    song = self.new
    song.save
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    f = filename.split(/[.]\w+\z/).join
    f = f.split(" - ")
    artist_name = f[0]
    name = f[1]

    song = self.new
    song.save
    song.name = name
    song.artist_name = artist_name
  end

  def self.destroy_all
    self.all.clear
  end
end
