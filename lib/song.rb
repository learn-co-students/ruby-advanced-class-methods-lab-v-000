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
    c = self.new
    c.save
    c
  end

  def self.new_by_name(name) # example Song.new_by_name('Hello')
    # we set song to an instance of the song class
    song = self.new
    # we use the writer/setter method name for the song insance to set it to the argument name
    song.name = name
    # we return the song instance
    song
  end

  def self.create_by_name(name)
      song = self.new
      song.name = name
      song.save
      song
  end

  def self.find_by_name(name)
    @@all.detect{|c|c.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
       self.create_by_name(name)
    else
       self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(full_name)
    each = full_name.split(" - ")
    artist_name = each[0]
    song_name = each[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(full_name)
    each = full_name.split(" - ")
    artist_name = each[0]
    song_name = each[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
      @@all = []
  end
end
