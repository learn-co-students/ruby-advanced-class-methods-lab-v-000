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
    self.new.save
    self.all[-1]
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song.save
    new_song
  end

  def self.find_by_name(song)
    self.all.bsearch {|s| s.name == song}
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) ? self.find_by_name(song) : self.create_by_name(song)
  end
end
