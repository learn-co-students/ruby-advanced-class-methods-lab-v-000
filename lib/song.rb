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
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = self.new 
  	song.name = name
  	@@all << song
  	song
  end

  def self.find_by_name(name)
  	self.all.find do |song| song.name == name 
  	end
  end

  def self.find_or_create_by_name(name)
  	if all.include?(name)
  		self.all.find do |song| song.name == name
  		end
  	else
  		song = self.new 
  		song.name = name
  		@@all << song
  		song
	end
end
  	
  	def self.alphabetical
  		self.all.sort_by do |song| song.name 
  		end
  	end

  	def self.new_from_filename(file)
  		song_data = file.split(/\s-\s|[.]/)
  		name = song_data[1]
  		artist_name = song_data[0]

  		song = self.new
  		song.name = name
  		song.artist_name = artist_name
  		song
  	end

  	def self.create_from_filename(file)
  		song_data = file.split(/\s-\s|[.]/)
  		name = song_data[1]
  		artist_name = song_data[0]

  		song = self.new
  		song.name = name
  		song.artist_name = artist_name
  		@@all << song 
  		song
  	end

  	def self.destroy_all
  		@@all.clear
  	end










end





