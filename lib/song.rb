class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
  	@name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # <------- why example said song = Song.create("The Middle")
  	song = self.new(name) 
  	song.save
  	return song
  end

  def self.new_by_name(name)
  	self.new(name)
  end

  def self.create_by_name(name)
  	song = self.new(name)
  	song.save
  	return song # -----> why does it have to return to work?
  end

  def self.find_by_name(name)
  	self.all.detect {|i| i.name == name}
  	# @all.detect {|i| i.name == name} ----> why doesn't this work?
  end

  def self.find_or_create_by_name(name)
  	f = self.all.detect {|i| i.name}
  	 if f != nil
  	 	return f
  	 else 
  	 	self.create_by_name(name) # ---- why not self.class.create_by_name(name)
  	 end
  end

  def self.alphabetical
  	self.all.sort_by{|i| i.name}
  end

  def self.new_from_filename(file)
  	 song = self.new(file.split(/\.|\s-\s/)[1])
  	 song.artist_name = file.split(/\.|\s-\s/)[0]
  	 return song

  end

  def self.create_from_filename(file)
  	song = self.new(file.split(/\.|\s-\s/)[1])
  	song.artist_name = file.split(/\.|\s-\s/)[0]
  	song.save
  	return song
  end

  def self.destroy_all
  	self.all.clear
  end

end
