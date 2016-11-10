class Song
  attr_accessor :artist_name
  @@all = []

  attr_reader :name

  def name=(name)
  	@name=name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	song=Song.new
    song.save
  	song
  end

  def self.new_by_name(name)
  	song=Song.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song=Song.create
  	song.name = name
  	song
  end

  def self.find_by_name(name)
  	self.all.detect{|song|
      song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name) == nil
  		self.create_by_name(name)
  	else
  		self.find_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
  	info=file.split(/\s\-\s|\./)
  	name=info[1]
  	artist=info[0]
  	song=Song.new
  	song.name = name
  	song.artist_name = artist
  	song
  end

    def self.create_from_filename(file)
  	info=file.split(/\s\-\s|\./)
  	name=info[1]
  	artist=info[0]
  	song=Song.create
  	song.name = name
  	song.artist_name = artist
  	song
  end

  def self.destroy_all
  	self.all.clear
  end

end
