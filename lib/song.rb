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
   new_song = self.new
    new_song.save.first
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end


   def self.create_by_name(name)
      new_song = self.new
     new_song.name = name
    new_song.save
     new_song
   end


 def self.find_by_name(name)
    self.all.find { |song| song.name == name }
 end

def self.find_or_create_by_name(name)
  if self.find_by_name(name) != nil
    return self.find_by_name(name)
  else
    self.create_by_name(name)
  end
end

  def self.alphabetical
   self.all.sort_by{|song| song.name}
 end

 def self.new_from_filename(filename)
   artist_name, song = filename[0...-4].split(" - ")
    new_song = self.new_by_name(song)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    artist_name, song = filename[0...-4].split(" - ")
    new_song = self.create_by_name(song)
    new_song.artist_name = artist_name
    new_song
  end

def self.destroy_all
    self.all.clear
  end


end
