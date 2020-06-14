class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def find_by_name

  end

  def self.find_or_create_by_name(name)
    if(self.find_by_name(name))
      return find_by_name(name)
    else
      self.create_by_name(name)
    end
    #self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.find_by_name(name)
    @@all.detect {|n| n.name == name}
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name }
  end

  def self.new_from_filename(file)
    song = self.new
    song.name = file.split(/\s\-\s|\.|[mp3]{3}/)[1]
    song.artist_name = file.split(/\s\-\s|\.|[mp3]{3}/)[0]
    song
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    self.class.all << self
  end

end
