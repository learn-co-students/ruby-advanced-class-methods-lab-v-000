require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    #why do you need the .class next to the self? why can't you just go @all << self? Again, resusability
    #self.all would give us an error because we are inside an instance method, so self refers to instance.
    #So we have to explicitly call the class
    self.class.all << self
    #@@all << self will have the same result
  end


  def self.create
    this_song = Song.new
    this_song.save
    return this_song

  end


  def self.new_by_name(song_name)
    this_song = Song.new
    this_song.name = song_name
    return this_song

  end


  def self.create_by_name(song_name)
    this_song = Song.new
    this_song.name = song_name
    this_song.save
    return this_song
  end


  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end


  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name)
      if found_song != nil
        found_song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end


  def self.new_from_filename(file_name)
    this_song = Song.new
    split_array = file_name.chomp('.mp3').split (" - ")
    this_song.artist_name= split_array[0]
    this_song.name= split_array[1]
    return this_song
  end


  def self.create_from_filename(file_name)
     new_song = self.new_from_filename(file_name)
     new_song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
