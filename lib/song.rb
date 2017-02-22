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
  	s = self.new
  	s.save
  	s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
  	s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
  	@@all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
  	unless self.find_by_name(name) == name
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical
  	@@all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
  	filename_array = filename.split(' - ')
  	artist_name = filename_array[0]
  	song_name = filename_array[1].chomp('.mp3')
 		s = self.new
 		s.name = song_name
  	s.artist_name = artist_name
    s
  end

  def self.create_from_filename(filename)
  	s = self.new_from_filename(filename)
    s.save
    s
  end

  def self.destroy_all
  	self.all.clear
  end

end
