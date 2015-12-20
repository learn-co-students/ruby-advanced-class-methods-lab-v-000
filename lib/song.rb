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
    @@all.detect{|song_name|song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song_name|song_name.name}
    
  end


  def self.new_from_filename(file)
    song = self.new
    parts = file.split(" - ")
    song.name = parts[1].gsub('.mp3','')
    song.artist_name = parts[0]
    song
  end

  def self.create_from_filename(file)
   
    parts = file.split(" - ")
    song_name = parts[1].gsub('.mp3','')
    song_artist_name = parts[0]

    song = self.create
    song.name = song_name
    song.artist_name = song_artist_name 
    song


  end

  def self.destroy_all
    self.all.clear
  end

end
