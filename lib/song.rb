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
  
  def self.new_by_name(song_name)
     song = self.new 
     song.name = song_name
     song 
  end
  
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save 
    song
  end 
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    
    if find_by_name(song_name) != nil 
      find_by_name(song_name) 
    else
      create_by_name(song_name) 
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename_string)
    #filename_array = filename_string.split(/[.-]/) - need to be able to remove whitespace
    song = self.new 
    song.artist_name = filename_string.split(" - ")[0]
    song.name = filename_string.split(" - ")[1].split(".")[0]
    song 
  end
  
  def self.create_from_filename(filename_string)
    new_from_filename(filename_string).save 
  end
  
  def self.destroy_all 
    self.all.clear 
  end

  
end







