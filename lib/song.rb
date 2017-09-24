class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all    
    self.all.clear  
  end

  def self.create
    song = self.new    
    @@all << song
    song
  end
 
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)  
  end

   def self.alphabetical
    all.sort_by{|a| a.name}
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    parsed2 = parsed[1].split(".")
    artist_name = parsed[0]
    song_name = parsed2[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parsed = filename.split(" - ")
    parsed2 = parsed[1].split(".")
    artist_name = parsed[0]
    song_name = parsed2[0]

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
end

end
