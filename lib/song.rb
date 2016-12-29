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
    @@all << song
    return song
  end
  def self.new_by_name(name)
    new_by_name = self.new
    new_by_name.name = name
    new_by_name
  end

  def self.create_by_name(name)
    create_by_name = self.new
    create_by_name.name = name
    @@all << create_by_name
    create_by_name
  end

  def self.find_by_name(name)
    find_by_name = self.new
    @@all.find {|x| x.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name (name) ==
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
def self.alphabetical
  @@all.sort_by {|names| names.name}

end

def self.new_from_filename(mp3)
    mp3.chomp!(".mp3")
    data = mp3.split(" - ")
    artist_name = data[0]
    name = data[1]
    # Make a new instance
    song = self.new
    song.artist_name = artist_name
    song.name = name
    # Return the song
    song
end

def self.create_from_filename(mp3)
  mp3.chomp!(".mp3")
   data = mp3.split(" - ")
   artist_name = data[0]
   name = data[1]
   # Make a new instance
   song = self.new
   song.artist_name = artist_name
   song.name = name
   # Return the song
   @@all << song
 end

  def self.destroy_all
    self.all.clear
  end
end
