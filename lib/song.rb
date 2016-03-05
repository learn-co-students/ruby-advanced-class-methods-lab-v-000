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
  def self.new_by_name(title)
    song = self.create
    song.name = title
    song  
  end
  def self.create_by_name(title) 
   
    self.new_by_name(title)
  end

  def self.find_by_name(title)
    @@all.find{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.create_by_name(title)
    self.find_by_name(title)
    
  end

  def self.alphabetical
  @@all.uniq.sort_by {|words| words.name} 
    
  end

  def self.new_from_filename(title)
    song = self.create
    split = title.split(" - ")
    song.artist_name = split[0]
    song.name = split[1].sub(".mp3", "")
  song
    
  end

  def self.create_from_filename(title)
    song = self.new_from_filename(title)
    
  end

  def self.destroy_all
    @@all.clear 
  end
 
end
