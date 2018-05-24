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
    song = Song.new 
    song.name = @name 
    @@all << song 
    song 
  end 
  
  
  def self.new_by_name(song_name)
    song = Song.new 
    song.name = song_name
    song
  end 
  
  
  def self.create_by_name(song_name)
    @name = song_name
    Song.create 
  end 
  
  
  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name }
  end 
  
  
  def self.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name)
      Song.find_by_name(song_name)
    else 
      Song.create_by_name(song_name)
    end 
  end 
  
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end 
  
  
  def self.new_from_filename(filename)
    file_name_array = filename.split("-")
    @artist_name = file_name_array[0].strip
    @name = file_name_array[1].sub('.mp3', '').strip
    song = Song.new
    song.name = @name 
    song.artist_name = @artist_name
    song 
  end 
  
  
  def self.create_from_filename(filename)
    file_name_array = filename.split("-")
    @artist_name = file_name_array[0].strip
    @name = file_name_array[1].sub('.mp3', '').strip
    song = Song.create
    song.artist_name = @artist_name
    song 
  end 
  
  
  def self.destroy_all
    self.all.clear
  end 

end