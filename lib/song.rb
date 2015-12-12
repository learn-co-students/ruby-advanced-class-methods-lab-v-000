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
    self.all << self.new
    self.all[-1]
  end

  def self.new_by_name(track)
    song = self.new
    song.name = track
    song
  end

  def self.create_by_name(track)
    song = self.new_by_name(track)
    self.all << song
    song
  end

  def self.find_by_name(track)
    self.all.detect {|song| song.name == track}
  end

  def self.find_or_create_by_name(track)
    if self.find_by_name(track) == nil
      self.create_by_name(track)
    else self.find_by_name(track)
    end
  end

  def self.alphabetical
    alphabetizable = []
    self.all.collect do |song| 
      alphabetizable << [song.name, song]
    end
    alphabetizable.sort.collect do |info|
      info[1]
    end
  end

  def self.new_from_filename(file)
    artist = file[0..file.index(/ - /) - 1]
    title = file[file.index(/ - /) + 3..file.index(/.mp3/) - 1]
    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end