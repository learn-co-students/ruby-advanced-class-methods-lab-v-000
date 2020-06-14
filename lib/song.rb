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
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(which_song)
    @@all.find {|song| song.name == which_song}
  end

  def self.find_or_create_by_name(which_song)
    found_song = self.find_by_name(which_song)
    if found_song
      found_song
    else
      self.create_by_name(which_song)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    parse_info = filename.chomp(".mp3").split(" - ")
    song.artist_name = parse_info[0]
    song.name = parse_info[1]
    song
  end
  def self.create_from_filename(filename)
    song = self.new
    parse_info = filename.chomp(".mp3").split(" - ")
    song.artist_name = parse_info[0]
    song.name = parse_info[1]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
