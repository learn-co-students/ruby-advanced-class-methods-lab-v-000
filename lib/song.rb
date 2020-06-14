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
  song.save
  song
end

def self.find_by_name(name)
  @@all.find {|song| song.name == name}
end

def self.find_or_create_by_name(name)
  until self.find_by_name(name)
   self.create_by_name(name)
  end
   self.find_by_name(name)
  end

  def Song.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
     filename_array = filename.split(" - ")
     artist_name = filename_array.first
     songname = filename_array.last.split(".")
     song_name = songname.first
 
     new_song = self.new
     new_song.name = song_name
     new_song.artist_name = artist_name
     new_song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.destroy_all
     @@all.clear
  end
end

  
