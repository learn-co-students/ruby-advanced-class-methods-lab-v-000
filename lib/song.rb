require'pry'
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
    self.all.detect{|song| song.name == name}
    #binding.pry
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      #elf.all.detect{|song| song.name == name}
      self.find_by_name(name)
    else
      #song = self.new
      #song.name = name
      #song.save
      #song
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|word| word.name}    
  end

  def self.new_from_filename(file_name)
    artist_song = file_name.chomp(".mp3")
    track_info = artist_song.split(" - ")
    artist_name = track_info[0]
    name = track_info[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(file_name)
    artist_song = file_name.chomp(".mp3")
    track_info = artist_song.split(" - ")
    artist_name = track_info[0]
    name = track_info[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end






end