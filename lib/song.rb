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
  	i = self.new
  	i.save
  	i
  end

  def self.new_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	new_song
  end

  def self.create_by_name(name)
  	i = self.create
  	i.name = name
  	i
  end

  def self.find_by_name(name)
  	@@all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
  	self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(file_name)
  	data = file_name.split(" - ").each { |x| x.chomp!(".mp3")}
  	 artist_name = data[0]
  	 name = data[1]
  	 i = self.new
  	 i.artist_name = artist_name
  	 i.name = name
  	 i
  end

  def self.create_from_filename(file_name)
  	self.new_from_filename(file_name).save
  end

  def self.destroy_all
  	self.all.clear
  end


end
