'require pry'
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
    #song.name = name
    #song.artist_name = artist_name
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
    #binding.pry 
    song.name = name
    song.save
    song 
  end

#  def find_name(string)
  #  song.name == string
#  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name) 
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    if filename.match(/.mp3/)
      artist_song = filename.rpartition(".").first.split("-")
      song = self.new
      song.name = artist_song[1].strip
      song.artist_name = artist_song[0].strip
      song
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end 

end
