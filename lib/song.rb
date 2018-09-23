class Song
  attr_accessor :name, :artist_name
  @@all = []
  ALL = []

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
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.detect { |x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) ||self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by { |s| s.name }
  end
  
  # def self.new_from_filename
  #   self." - .mp3"
  #   self.all each do |person|
  #   person.name = person.name.split(" - .mp3")
  #   song.name = 
  #   song.artist_name =
  # end
  
  def self.destroy_all
    ALL.clear
  end
end