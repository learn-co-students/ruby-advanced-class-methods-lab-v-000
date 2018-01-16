class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create
        song = self.new
        @@all << song
        song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect(nil) {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) != nil ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(string)
    info = string.split(" - ")
    song = new_by_name(info[1].sub!(".mp3",""))
    song.artist_name = info[0]
    song
  end

  def self.create_from_filename(string)
    song = new_from_filename(string)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
