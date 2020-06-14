class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self #pushes new items to @@all
  end

  def self.create #=song.create, created one and saved it
    song = self.new #instantiates with new
    self.all << song # expect (Song.all).to include(song)
    song
  end

  def self.new_by_name(name) #created one with name and didn't save it
    song = self.new #instantiate a song
    song.name = name #set name
    song #return the song
  end

  def self.create_by_name(name)#created one with name and saved all together
    song = self.new #instantiate a song
    song.name = name #set name
    self.all << song #save it
    song
  end

  def self.find_by_name(name)#looks in @@all array
    self.all.detect  {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
