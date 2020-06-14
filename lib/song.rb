require 'pry'
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
    x = self.new
    @@all << x
    return x
  end

  def self.new_by_name(song_name)
    song = self.new
     song.name = song_name
    return song
end

def self.create_by_name(song_name)
  song = self.new
  @@all << song
   song.name = song_name
  return song
end

def self.find_by_name(song_name)
  @@all.detect{|song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  else
    self.create_by_name(song_name)
  end
end

def self.alphabetical
  song_bin = []
   self.all.sort_by  {|song| song.name}
   end

   def self.new_from_filename(mp3_file)
     updated_mp3 = mp3_file.split(" - ")
     artist_name = updated_mp3[0]
     song_name = updated_mp3[1].sub(/.mp3/,"")
     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
end

  def self.create_from_filename(mp3_file)
    updated_mp3 = mp3_file.split(" - ")
    artist_name = updated_mp3[0]
    song_name = updated_mp3[1].sub(/.mp3/,"")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
  end



  def self.destroy_all
    @@all.clear
  end

end
