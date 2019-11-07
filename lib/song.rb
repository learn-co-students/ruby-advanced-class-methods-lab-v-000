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
    return song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    return song
  end

  def self.create_by_name(title)
    song = self.new
    song.save
    song.name = title
    return song
  end

  def self.find_by_name(title)
    result = []
    self.all.each do |song|
      if song.name == title
        result << song
      end
    end
    return result[0]
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    control = []
    alphabetized = []
    self.all.each do |song|
      control << song.name
    end
    control.sort.each do |title|
      alphabetized << self.find_by_name(title)
    end
    return alphabetized
  end

  def self.new_from_filename(filename)
    separated = filename.split(" - ")
    artist = separated[0]
    song_name = separated[1].chomp(".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist
    return song
  end

  def self.create_from_filename(filename)
    separated = filename.split(" - ")
    artist = separated[0]
    song_name = separated[1].chomp(".mp3")
    song = self.new
    song.save
    song.name = song_name
    song.artist_name = artist
    return song
  end

  def self.destroy_all
    self.all.clear
  end
end
