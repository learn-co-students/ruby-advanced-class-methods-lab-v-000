class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

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

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = self.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	@@all.find do |f|
  		f.name == name
  	end
  end

  def self.find_or_create_by_name(name)
  	unless find_by_name(name)
  		create_by_name(name)
  	end
  	find_by_name(name)
  end

  def self.alphabetical
  	all.sort_by {|f| f.name}
  end

  def self.new_from_filename(filename)
  	full = filename.split(/[-.]/).map(&:strip)
  	song = self.new
  	song.artist_name = full[0]
  	song.name = full[1]
  	song
  end

  def self.create_from_filename(filename)
  	full = filename.split(/[-.]/).map(&:strip)
  	song = self.new
  	song.artist_name = full[0]
  	song.name = full[1]
  	song.save
  	song
  end

  def self.destroy_all
  	@@all.clear
  end
end

