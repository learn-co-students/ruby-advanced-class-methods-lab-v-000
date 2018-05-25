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
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil
      song = Song.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    new_array = []
    sorted_songs = []
    Song.all.each do |person|
      new_array << person.name
    end
    new_array = new_array.sort
    new_array.each do |song|
      sorted_songs << @@all.detect {|person| person.name == song}
    end
    sorted_songs
  end

  def self.new_from_filename(name)
    name.slice!(/\.\w+$/)
    artist = name[/^\w+\b/]
    name.slice!(/^\w+\b/)
    name.slice!(/( - )/)
    song = name

    new_song = self.new_by_name(song)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(name)
    name.slice!(/\.\w+$/)
    artist = name[/^\w+\b/]
    name.slice!(/^\w+\b/)
    name.slice!(/( - )/)
    song = name

    new_song = self.new_by_name(song)
    new_song.artist_name = artist
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
