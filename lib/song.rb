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
    return song
  end

  def self.new_by_name(var)
    song = Song.new
    song.name = var
    return song
  end

  def self.create_by_name(var)
    song = Song.new
    song.name = var
    song.save
    return song
  end

  def self.find_by_name(var)
    self.all.detect do |song|
      song.name == var
    end
  end

  def self.find_or_create_by_name(var)
    self.find_by_name(var) || self.create_by_name(var)
  end

  def self.alphabetical
    self.all.sort_by{|var| var.name}
  end

  def self.new_from_filename(var)
    songParts = var.chomp!(".mp3").split(" - ")
    song = Song.new
    song.artist_name = songParts[0]
    song.name = songParts[1]
    # songParts[1].slice! songParts[3]
    return song
  end

  def self.create_from_filename(var)
    @@all << self.new_from_filename(var)
  end

  def self.destroy_all
    @@all.clear
  end
end
