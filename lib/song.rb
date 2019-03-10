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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
    end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
       self.create_by_name(song_name)
     end
  end
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

def self.new_from_filename(filename)
  song = self.new
  song_info = filename.split(".")[0]
  song.name = song_info.split(" - ")[1]
  song.artist_name = song_info.split(" - ")[0]
  song
end

def self.create_from_filename(filename)
  song = self.create
  song_info = filename.split(".")[0]
  song.name = song_info.split(" - ")[1]
  song.artist_name = song_info.split(" - ")[0]
  song
end
def self.destroy_all
  self.all.clear
end

end
