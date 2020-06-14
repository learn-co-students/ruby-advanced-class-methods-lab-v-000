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
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.all.detect{|song| song.name == name}
    else
      song = self.new
      song.name = name
      self.all << song
      song
    end
  end

  def self.alphabetical
    self.all.sort{|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    #potrei eliminare il .mp3 usando .sub(".mp3", "") che sostituisce .mp3 con uno spazio
    data = filename.split(".")
    separated_name = data[0].split(" - ")
    name = separated_name[1]
    artist_name = separated_name[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(string)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
