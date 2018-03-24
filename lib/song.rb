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
   song = Song.new
   song.name = name
   song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   if !self.find_by_name(name)
     self.create_by_name(name)
   else
     self.find_by_name(name)
   end
  end

 def self.alphabetical
   Song.all.sort_by{|song|song.name}
 end

 def self.new_from_filename(name)
   song = Song.new
   split_filename = name.split(" - ")
   song.name = split_filename[1].gsub(".mp3", "")
   song.artist_name = split_filename[0]
   song
 end

 def self.create_from_filename(name)
   song = self.create
   split_filename = name.split(" - ")
   song.name = split_filename[1].gsub(".mp3", "")
   song.artist_name = split_filename[0]
   song
 end

 def self.destroy_all
   self.all.clear
 end

end
