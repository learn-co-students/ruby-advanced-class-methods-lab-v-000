class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) if self.find_by_name(name) == nil
    return self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |a, b|
      a.name<=>b.name
    }
  end

  def self.new_from_filename(str)
    comp = str.split('-')
    song = self.new_by_name(comp[1].strip.scan(/\b.*[^.mp3 .mp4 .aac]/)[0])
    song.artist_name = comp[0].strip
    song
  end

  def self.create_from_filename(str)
    comp = str.split('-')
    song = self.create_by_name(comp[1].strip.scan(/\b.*[^.mp3 .mp4 .aac]/)[0])
    song.artist_name = comp[0].strip
    song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
