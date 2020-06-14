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
    @@all << song
    return song
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end


  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    title_artist = filename.split(" - ")
    song.artist_name = title_artist[0]
    song.name = title_artist[1].chomp(".mp3")
    return song
  end

  def self.create_from_filename(filename)
    song = self.new
    title_artist = filename.split(" - ")
    song.artist_name = title_artist[0]
    song.name = title_artist[1].chomp(".mp3")
    @@all << song
    return song
  end

  def self.destroy_all
    @@all.clear
  end

end
