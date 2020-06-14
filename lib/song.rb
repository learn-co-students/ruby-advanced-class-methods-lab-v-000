require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    #=> self at the beginning refers to the class itself
    self.class.all << self #=> instance of a song
    #=> .class refers to the class name itself
  end
  
  def self.create #=> save object
    new_object = self.new
    #=> utilize attr_accessor name writer method
    #=> need the following line if I don't initialize with the name argument!
    #new_object.name = name
    new_object.save
    new_object
  end
  
  def self.new_by_name(song_name) #=> make object and give it attributes
		song = self.new #=> creates a new song
		song.name = song_name #=> used the argument "song_name" to create a name for this instance of the song
		song #=> return instance of the Song
	end
	
	def self.create_by_name(name)
		song_object = self.new_by_name(name)
		song_object.save
		song_object
	end
	
	def self.find_by_name(name)
	  self.all.find do |song|
	    song.name == name
	  end
	end
	
	def self.find_or_create_by_name(name)
	  #=> if find_by_name doesn't find a object's name attribute that matches the argument, then create_by_name!
	  if self.find_by_name(name) == nil
	    self.create_by_name(name)
	    
	  else #=> if find_by_name returns an object, return the object
	    self.find_by_name(name)
	  end
	end
	
	def self.alphabetical
	  self.all.sort_by {|song_object| song_object.name}
	end
	
	def self.new_from_filename(filename)
	  file_name = filename.split(/[-.]/)
	  file_name[0].strip
	  file_name[1].strip
	  song_object = self.new_by_name(file_name[1].strip)
	  song_object.artist_name = (file_name[0].strip)
	  song_object
	end
	
	#=> look at create_by_name method; CREATE METHOD WILL SAVE YOUR OBJECT!
	def self.create_from_filename(filename)
	  file_name = self.new_from_filename(filename)
	  file_name.save
	  file_name
	end
	
	def self.destroy_all
	  self.all.clear
	end
end
