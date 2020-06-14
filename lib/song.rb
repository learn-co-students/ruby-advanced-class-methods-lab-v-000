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
    x=Song.new
    self.all << x
    x
  end
  
  def self.new_by_name(n)
    x=Song.new
    x.name=n
    x
  end 
  
  def self.create_by_name(n)
    x=Song.new
    x.name=n 
    self.all << x
    x
  end
  
  def self.find_by_name(n)
    self.all.find{|x| x.name==n}
  end
  
  def self.find_or_create_by_name(n)
    if self.find_by_name(n)
      self.find_by_name(n)
    else 
      self.create_by_name(n)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|n| n.name}
    
  end
  
  def self.new_from_filename(fn)
    artist_song=fn.split(' - ')
    a=artist_song[0]
    s=artist_song[1].chomp!('.mp3')
    song=Song.new 
    song.name=s 
    song.artist_name=a 
    song
  end 
  
  def self.create_from_filename(fn)
    artist_song=fn.split(' - ')
    a=artist_song[0]
    s=artist_song[1].chomp!('.mp3')
    song=Song.new 
    song.name=s 
    song.artist_name=a
    self.all << song 
  end 
  
  def self.destroy_all 
    self.all.clear
  end
    
  
end










