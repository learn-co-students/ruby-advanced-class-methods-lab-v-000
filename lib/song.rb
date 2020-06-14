class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
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

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|title| title.name}
  end
  
  def self.new_from_filename(file)
    song = self.new
    file_parse = file.split(" - ")
    song.artist_name = file_parse[0]
    song_str = file_parse[1].chomp(".mp3")
    song.name = song_str
    song
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
