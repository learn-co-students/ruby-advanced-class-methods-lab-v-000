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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
   @@all.detect{ |song| song.name == name }
 end

 def self.find_or_create_by_name(name)
#  if  @@all.detect{ |song| song.name == name }
#     @@all.detect{ |song| song.name == name }
#   else
#     self.create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
    #self.all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    song = self.new
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
