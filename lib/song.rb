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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
  #  self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
      self.all.detect{|person| person.name == name}
    end

  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song = Song.new
    sn_name = file.split(" - ")
    song.name = sn_name[1].match(/(.*).mp3/)[1]
    song.artist_name = sn_name[0]
    song
  end

  def self.create_from_filename(file)
    #self.new_from_filename(file)
    song = Song.new
    sn_name = file.split(" - ")
    song.name = sn_name[1].match(/(.*).mp3/)[1]
    song.artist_name = sn_name[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end #end of song class
