
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  def self.all
    @@all
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
    self.all.detect { |artist| artist.name == name }
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
   end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
 end

 def self.new_from_filename(name)
   row = name
   data = row.split(" - ")
   artist_name = data[0]
   song_name = data[1].gsub(".mp3","")

   song = self.new
    song.name = song_name
   song.artist_name = artist_name
   song

 end

 def self.create_from_filename(name)
   song = Song.new_from_filename(name)
   song.save
   song
 end

 def self.destroy_all
   all.clear
 end
end
