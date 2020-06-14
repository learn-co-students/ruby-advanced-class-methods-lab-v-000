class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(new_song)
    song = self.new
    song.name = new_song
    song
  end

  def self.create_by_name(new_song)
    song = self.new
    song.name = new_song
    @@all << song
    song
  end

  def self.find_by_name(search)
    @@all.detect {|name| name.name == search}
  end

  def self.find_or_create_by_name(search)
    if @@all.detect {|name| name.name == search}
      search
    else
      song = self.new
      song.name = search
      song
    end
  end

  def self.alphabetical
    @@all.sort_by { |word| word.name.downcase}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    name = data[1]
    name.slice! ".mp3"
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    unless filename.end_with? (".mp3")
      puts "Non valid file format!"
    else
      data = filename.gsub(".mp3", "").split(" - ")
      name, artist_name = data[1], data[0]
      song = self.create_by_name(name)
      song.artist_name = artist_name
      song
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
