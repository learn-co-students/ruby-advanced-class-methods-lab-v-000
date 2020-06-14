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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
   song = self.new
   song.name = name
   song

 end

 def self.create_by_name(name)
   song = self.new_by_name(name)
   song.save
   song
 end

 def self.find_by_name(name)
   self.all.find{|song| song.name == name}
 end

 def self.find_or_create_by_name(name)
   if self.find_by_name(name) == nil
     self.create_by_name(name)
   else
     self.find_by_name(name)
   end
 end

 def self.alphabetical
  self.all.sort_by{|s| s.name }

 end

 def self.new_from_filename(name)
   song_name = name.split(" - ")
   artist_name = song_name[0]
   song_name = song_name[1].gsub(".mp3", "")

   song = self.new
   song.name = song_name
   song.artist_name = artist_name

   song

   end

   def self.create_from_filename(filename)
     self.new_from_filename(filename).save
   end

   def self.destroy_all
     @@all.clear
   end




end
