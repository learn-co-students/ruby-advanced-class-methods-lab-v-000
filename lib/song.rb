class Song
  attr_accessor :name, :artist_name
  
  def initialize(name)
  	@name = name 
  end 

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	 new_song = self.new(name) 
  	 @@all << new_song
  	 new_song
  end

  def self.new_by_name(name)
  	self.new(name)
  end

  def self.create_by_name(name)
  	 new_song = self.new(name)
  	 @@all << new_song 
  	 new_song
  end

  def self.find_by_name(name)
  	self.all.detect{|song| song.name == name}
  end	

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  		self.find_by_name(name)
  	else 
  	   self.create_by_name(name) 
  	end	
  end 

  def self.alphabetical 
  	@@all.sort_by{|i| i.name}
  end

  def self.new_from_filename(item)
  	filenames = item.split(" - ")
  	filenames.each do |file|
  		if file.end_with?(".mp3")
  			file[".mp3"] = ''
  		end
  	end
  	new_song= Song.new(filenames[1])
  	new_song.artist_name= filenames[0]
  	new_song		
  end

  def self.create_from_filename(item)
  	new_song = self.new_from_filename(item)
  	new_song.save
  end

  def self.destroy_all
  	@@all = []
  end
end
