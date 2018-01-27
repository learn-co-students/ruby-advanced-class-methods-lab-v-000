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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name=song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name=song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.all.detect{|x| x.name == song_name}
      self.all.detect{|x| x.name == song_name}
    else
      song = self.new
      song.name=song_name
      self.all << song
      song
    end
  end

   def self.alphabetical
     self.all.sort_by!{|x| x.name}
   end

   def self.new_from_filename(file_name)
     song = self.new
     self.all << song
     song_info = file_name.split(/ - |.mp3/)
     song.artist_name = song_info[0]
     song.name=song_info[1]
     song
   end

   def self.create_from_filename(file_name)
     song = self.new
     self.all << song
     song_info = file_name.split(/ - |.mp3/)
     song.artist_name = song_info[0]
     song.name=song_info[1]
     song
   end

   def self.destroy_all
     self.all.clear
   end




end
