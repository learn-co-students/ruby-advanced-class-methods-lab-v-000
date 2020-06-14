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
    new_song = new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    all.find { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    instance = find_by_name(name)
    if instance
      instance
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    song = filename.split(/[\.-]/)
    new_song = new
    new_song.name = song[1].strip
    new_song.artist_name = song[0].strip
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end

  def self.destroy_all
    all.clear
  end
end
