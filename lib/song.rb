class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize    #my code
  #   # @@all << self
  # end

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
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.all.detect{|song| song.name == song_name}
    if song
      return song
    else 
      song = self.new
      song.name = song_name
      return song
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    filename = name.chomp(".mp3").split(" - ")  #name.chomp(".mp3") removes .mp3 from the filename
    newsong = self.new_by_name(filename[1])   #creates a new instance variable and calls on the new_by_name method, using only the element at position 1 "blankspace"
    newsong.artist_name = filename [0]
    newsong
  end

  def self.create_from_filename(filename)
    newsong = self.new_from_filename(filename)
    newsong.save
  end

  def self.destroy_all
    self.all.clear
  end

   


end
