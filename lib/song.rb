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
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    song
  end
  
  def self.create_by_name(name)
   song = self.new
   @name = name
   song.name = @name
   @@all << song
   song
  end
    
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
        self.create_by_name(name)
      else
        song
    end
  end
    
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    song_info = filename.split(" - ")
    @artist_name = song_info[0]
    title = song_info[1].split(".mp3")
    @name = title.join
    song.artist_name = @artist_name
    song.name = @name
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end
  
  def self.destroy_all
    @@all = [ ]
  end
end
