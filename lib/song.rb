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
  new_song = self.new
  new_song.name = name
  @@all << new_song
  new_song
end

def find_by_name(name)
  @@all.detect{|song| song.name}

end
# Unless executes code if conditional is false - so find or create, if found do nothing. else create.
  def self.find_or_create_by_name(name)
    create_by_name(name) unless find_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
    
  end

# filename in the format of " - .mp3" Note one regex splits it on the hyphen and the .mp3
  def self.new_from_filename(mp3)
    new_filename = mp3.split(/\s[-]\s|.mp3/)
    new_song = self.new
    new_song.artist_name = new_filename[0]
    new_song.name = new_filename[1]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
