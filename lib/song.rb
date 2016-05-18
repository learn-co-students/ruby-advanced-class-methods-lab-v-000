class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create    
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name    
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song    
    song   
  end

  def self.find_by_name(song_name)
    song_found = nil
    self.all.each {|song| song_found = song if song.name == song_name}    
    song_found
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) == nil ? self.create_by_name(song_name) : self.find_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|i| i.name}   
  end

  def self.new_from_filename(song_name)
    name_arr = song_name.split(/\s-\s/)
    song = self.new
    song.artist_name = name_arr[0]
    song.name = name_arr[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(song_name)
    @@all << self.new_from_filename(song_name)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
