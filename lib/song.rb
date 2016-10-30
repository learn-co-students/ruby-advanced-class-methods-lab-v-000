require 'pry'
class Song
 attr_accessor :name, :artist_name
 @@all = []

#will attempt to instantiate and save the song and then return the song that was created
 def self.create
   song = self.new
   @@all << song
   song
 end

#will give a song with a name property
 def self.new_by_name(name)
   song_name = self.new
   song_name.name = name
   @@all << song_name
   song_name
 end

#will save a song with a name property
 def self.create_by_name(name)
   song = self.new
   song_name = self.new
   song_name.name = name
   @@all << song_name
   song_name
 end

#will find a song that exists in @@all by the name of it
 def self.find_by_name(name)
   name = @@all.select {|c| c.name == name}
   name[0]
 end

#will find or create a song by name, maintaining the uniqueness of objects by name property
 def self.find_or_create_by_name(name)
   if @@all.select{|c| c.name == name}.include?(name)
     name
   else
     song = self.new
     song.name = name
      @@all << song
      song
    end
  end

#will return all the song instances in alphabetical order by song name
  def self.alphabetical
    @@all.sort_by{|word| word.name}
    #binding.pry
  end

#will initialize a song and and artist name
  def self.new_from_filename( filename)
    song = self.new
    song.name = filename.split("-")[1].split(".")[0].strip
    song.artist_name = filename.split("-")[0].strip
    song
  end

#will create and save a song and artist name based on a file format
  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split("-")[1].split(".")[0].strip
    song.artist_name = filename.split("-")[0].strip
    @@all << song
  end

#will delete everything - OK
  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
