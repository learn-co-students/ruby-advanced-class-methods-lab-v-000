class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save if !self.all.include?(song)

    song
  end

  def self.new_by_name(name)
    song = self.new.tap {|s| s.name = name }
  end

  def self.create_by_name(name)
    song = self.create.tap {|s| s.name = name }
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|song1, song2| song1.name <=> song2.name }
  end

  def self.new_from_filename(filename)
    file = filename.split(/\s-\s|.mp3/)
    song = self.new.tap {|s| s.artist_name, s.name = file }
  end

  def self.create_from_filename(filename)
    file = filename.split(/\s-\s|.mp3/)
    song = self.create.tap {|s| s.artist_name, s.name = file }
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
