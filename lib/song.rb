class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
  self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create 
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song

  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    song.save
    song
  end

  def self.find_by_name(title)
     @@all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
      self.create_by_name(name)
      self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    new_song = file.split(/ \- |[.]/)
    song = self.new
    song.artist_name = new_song[0]
    song.name = new_song[1]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
