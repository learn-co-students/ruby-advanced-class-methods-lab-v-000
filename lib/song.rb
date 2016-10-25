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
    new_song = self.new
    @@all << new_song
    new_song
  end

  #the class constructor above is tested below:
  song = Song.create
  puts Song.all.include?(song) #=> true

  def self.new_by_name(name)
    named_song = self.new
    named_song.name = name
    named_song
  end

  #the class constructor above is tested below:
  song = Song.new_by_name("The Middle")
  #=> #<Song @name="The Middle">
  puts song.name #=> "The Middle"

  def self.create_by_name(name)
    named_song = self.new #shouldn't use self.create here because that will store to @@all before naming
    named_song.name = name
    @@all << named_song
    named_song
  end

  #the class constructor above is tested below:
  song = Song.create_by_name("The Middle")
  #=> #<Song:0x007fd2a2989ff0 @name="The Middle">
  song
  #=> #<Song:0x007fd2a2989ff0 @name="The Middle">
  puts Song.all.include?(song)
  #=> true

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  #the class finder above is tested below:
  the_middle = Song.create_by_name("The Middle")
  #=> #<Song @name="The Middle">
  puts Song.find_by_name("The Middle")
  #<Song @name="The Middle">

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  #the class method above is tested below:
  song_1 = Song.find_or_create_by_name("Blank Space")
  song_2 = Song.find_or_create_by_name("Blank Space")
  # song_1 and song_2 are conceptually the same song and should return the same song instance because of `.find_or_create_by_name.`
  puts song_1 == song_2 #=> true

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    artist_parse = filename.scan(/^.*-/)[0].chomp(" -")
    song_parse = filename.scan(/-.*mp3/)[0].chomp(".mp3")[2..-1]
    new_song = self.create_by_name(song_parse)
    new_song.artist_name = artist_parse
    new_song
  end

  #the class constructor above is tested below:
  song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
  puts song.name #=> "Blank Space"
  puts song.artist_name #=> "Taylor Swift"

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
