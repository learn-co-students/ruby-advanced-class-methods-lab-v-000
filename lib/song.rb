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
    @@all << song
    return song
  end
  
  def self.new_by_name(name)
    @name = name
    song = self.new
    song.name = @name
    return song
  end
  
  def self.create_by_name(name)
    @name = name
    song = self.new
    song.name = @name
    @@all << song
    return song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    @name = name
    if !@@all.include?(name)      
      song = self.new
      song.name = @name
      @@all << song
    end
    return song
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)    
    data = filename.split(" - ")
    artist_name = data[0]
    mp3_song_name = data[1].split(".mp3")
    song_name = mp3_song_name[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    return song
  end
  
  def self.create_from_filename(filename) 
       data = filename.split(" - ")
        artist_name = data[0]
        mp3_song_name = data[1].split(".mp3")
        song_name = mp3_song_name[0]
       if !@@all.include?(song_name) 
        song = self.new
        song.name = song_name
        song.artist_name = artist_name     
        @@all << song 
     end
    return song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
