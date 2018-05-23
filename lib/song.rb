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
    song =  self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   song = self.find_by_name(name)
   if song
     return song
   else
     self.create_by_name(name)
   end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    array = file.split(" - ")
    song = self.new
    song.artist_name = array[0]
    song.name = (array[1].split("."))[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end
end
