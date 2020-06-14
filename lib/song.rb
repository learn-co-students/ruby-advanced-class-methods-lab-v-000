class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|v| v.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)||self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|v| v.name}
  end
  def self.new_from_filename(name)
    splt = name.sub(/\b.mp3/, '').split(" - ")
    song = self.create_by_name(splt[1])
    song.artist_name = splt[0]
    song
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
