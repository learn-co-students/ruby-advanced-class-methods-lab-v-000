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
    return song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end
  
  def self.new_from_filename(file)
    array = file.chomp(".mp3").split("-")
    song = self.new
    song.name = array[1].strip
    song.artist_name = array[0].strip
    return song
  end

  def self.create_from_filename(file)
    array = file.chomp(".mp3").split("-")
    song = self.new
    song.name = array[1].strip
    song.artist_name = array[0].strip
    song.save
    return song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
