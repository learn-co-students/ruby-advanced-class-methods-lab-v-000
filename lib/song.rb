#   ~~~HAVICK WAS HERE ~~~



class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


 def initialize
  	@name = name
  	@@all << self
  end

def self.all
	@@all
end

  def self.create

    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
end

def self.create_by_name(title)

  self.new_by_name(title)

    end

def self.find_by_name(search_title)

	Song.all.detect {|title| title.name == search_title}

end

def self.find_or_create_by_name(name)
  !(self.find_by_name(name)) ? self.create_by_name(name) : self.find_by_name(name)
end

def self.alphabetical
  Song.all.sort_by{|title| title.name}.uniq
end

def self.new_from_filename(filename)
	info = filename.gsub(" - ", ",").split(/[\,\.]/)
	artist_name = info[0]
	name = info[1]
	song = self.new
	song.name = name
	song.artist_name = artist_name
  song.save
  song
end

def self.create_from_filename(filename)
  self.new_from_filename(filename)
end
def self.destroy_all
  Song.all.clear
end
end
