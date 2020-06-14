class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
   song = self.new
   @@all << song
   return song 
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
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil 
      self.create_by_name(song_name)
    else 
      self.find_by_name(song_name)
    end 
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    song = self.new 
    rows = filename.split("-")
    song.artist_name = rows[0].strip 
    song_name = rows[1]
    rows_2 = song_name.split(".")
    song.name = rows_2[0].strip 
    song 
  end 

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song 
  end 
  
  def self.destroy_all
    @@all = []
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
