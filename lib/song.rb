class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
   new_song = self.new
   new_song.save
   new_song
  end  
  
  def self.new_by_name(name) # example Song.new_by_name('Hello')
    # we set song to an instance of the song class
    song = self.new
    # we use the writer/setter method name for the song insance to set it to the argument name
    song.name = name
    # we return the song instance
    song
  end 
  
  def self.create_by_name(name)
     song = self.new
     song.name = name
     song.save
     song
  end

  def self.find_by_name(name)
    Song.all.detect{|song| song.name == name}   
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end   
  
  def self.new_from_filename(name)  # ["thundercat", "for love i come.mp3"]
    filename_song = name.split(" - ")
      song_name = filename_song[1]
      song_name = song_name.gsub(".mp3", "") 
      artist_name = filename_song[0]
      new_song = new_by_name(song_name)
      new_song.artist_name = artist_name 
      new_song
  end

  def self.create_from_filename(name)
    new_from_filename(name).save
  end

  def self.destroy_all
    all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
