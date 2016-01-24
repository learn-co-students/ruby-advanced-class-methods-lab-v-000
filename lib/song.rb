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
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.all.detect do |song| 
      song.name == name
      return song
    end
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(file)
    new_file = file.split(" - ")
    new_file[1].gsub!(".mp3", "")
    song = self.new
    song.name = new_file[1]
    song.artist_name = new_file[0]
    song
  end

  def self.create_from_filename(file)
    new_file = file.split(" - ")
    new_file[1].gsub!(".mp3", "")
    song = self.create
    song.name = new_file[1]
    song.artist_name = new_file[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
