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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|x| x.name}
  end

  def self.new_from_filename(name)
    rows = name.split(/[-.]/)
    song_name = rows[1].strip
    artist = rows[0].strip

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(name)
    rows = name.split(/[-.]/)
    song_name = rows[1].strip
    artist = rows[0].strip

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end
end
