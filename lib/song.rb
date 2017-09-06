class Song
  attr_accessor :name, :artist_name# song instances
  @@all = []# store all instances

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  #@@all << self.new
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
  @@all << song
  song
end

def self.find_by_name(song_name)
  self.all.detect {|s| s.name == song_name}
  #self.all.detect {|song| song.name == song_name}

end

def self.find_or_create_by_name(song)
   find_by_name(song) || create_by_name(song)
  # if self.find_by_name(song)
  #   return self.find_by_name(song)
  # else
  #   self.create_by_name(song)
  # end
end

def self.alphabetical
  @@all.sort_by {|song| song.name}
end

def self.new_from_filename(new_song)
   new_song = new_song.chomp(".mp3").split(" - ")
   song = self.new
   song.name = new_song[1]
   song.artist_name = new_song[0]
   song.save
   song

end

def self.create_from_filename(file_name)
   # shorter solution calling self.new_from_filename method
   song = self.new_from_filename(file_name)
   self.all << song
 end


def self.destroy_all
  self.all.clear
  end


end
