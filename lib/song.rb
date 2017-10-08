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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name  }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song != nil
      song
    else
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    @@all.sort_by! { |song| song.name }
    @@all
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    song = self.create_by_name(file[1].gsub(/.mp3/, ""))
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
