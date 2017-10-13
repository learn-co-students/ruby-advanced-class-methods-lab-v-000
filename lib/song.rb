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
   new_song = Song.new
   @@all << new_song
   new_song
 end

def self.new_by_name(name)
  new_song=Song.new
  new_song.name=name
  new_song
end

def self.create_by_name(name)
  new_song=Song.new
  new_song.name=name
  @@all << new_song
  new_song
end


 def self.find_by_name(name)
matching_songs = Song.all.select {|songs_in_database| songs_in_database.name==name}
matching_songs[0]
end

   def self.find_or_create_by_name(name)
   result_of_search=self.find_by_name(name)
   if result_of_search == nil
  self.create_by_name(name)
else
  return result_of_search
 end
 end


 def self.alphabetical
   @@all.sort {|a,b|a.name<=>b.name}
 end

 def self.new_from_filename(filename)
  new_song=Song.new
  new_song.name=filename.split(" - ")[1].split(".")[0]
  new_song.artist_name=filename.split(" - ")[0]
  new_song
 end

 def self.create_from_filename(filename)
new_song=Song.new
new_song.name=filename.split(" - ")[1].split(".")[0]
new_song.artist_name=filename.split(" - ")[0]
@@all << new_song
 end


 def self.destroy_all
   self.all.clear
   @@all.clear
  end
end
