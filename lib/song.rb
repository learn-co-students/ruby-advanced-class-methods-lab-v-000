require "pry"

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
    self.all << self.new
    self.all[-1]
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  #  binding.pry
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    titles = self.all.collect {|title| title.name}
    answer = []
    if titles.include?(song_name)
      self.all.each {|title| answer << title if title.name == song_name}
      answer[0]
    else nil
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|obj| obj.name}
  end

  def self.new_from_filename(file_name)
    new_song = self.new
    arr = file_name.split(/[-.]/)
    arr.delete(arr[-1])
    new_song.artist_name = arr[0].strip
    new_song.name = arr[1].strip
    new_song
  end

  def self.create_from_filename(file_name)
    self.all << self.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all = [] 
  end

end


yeah = Song.create_by_name("Yeah!")
burn = Song.create_by_name("Burn")
throwback = Song.create_by_name("Throwback")
#Song.find_or_create_by_name("My Boo")
#file_song = Song.new_from_filename("Paramore - Misery Business.mp3")
