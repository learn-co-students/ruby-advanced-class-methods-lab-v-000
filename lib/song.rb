class Song
  attr_accessor :name, :artist_name
  @@all = []
 

  def self.all
    @@all
  end # of self.all


  def save
    self.class.all << self
  end # of save 


  def self.create
    song = self.new
    song.name = name
    song.save
    song 
  end # of self.create


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end # of self.new_by_name


  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song  
  end # of self.create_by_name


  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end # of self.find_by_name
    

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end # of if 
  end # of self.find_or_create_by_name


  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end # of self.alphabetical

  def self.new_from_filename(filename)
    data = filename.split("-")
    song_name = data[1].split(".mp3").join(" ").strip
    song = self.new_by_name(song_name)
    song.artist_name = data[0].strip
    song
  end # of self.new_from_filename


  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save 
  end # of self.create_from_file_name


  def self.destroy_all
    @@all.clear 
  end # of destroy_all


end # of class 
