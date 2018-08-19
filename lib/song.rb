class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    @@all << song
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.each do |song|
      return song if song.name == song_name
    end
    nil
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      song = self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    data = filename.split(/[-.]/)
    song.name = data[1].strip
    song.artist_name = data[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    data = filename.split(/[-.]/)
    song.name = data[1].strip
    song.artist_name = data[0].strip
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
