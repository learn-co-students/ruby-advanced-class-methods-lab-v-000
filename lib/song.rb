class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    @@all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if (song = self.find_by_name(name))
      song
    else
      create_by_name(name)
    end
  end

  def self.all
    @@all
  end

  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end

  def self.new_from_filename(file)
    song_info = file.split(/ - |\.mp3/)
    song = self.new_by_name(song_info[1])
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(file)
    song_info = file.split(/ - |\.mp3/)
    song = self.new_by_name(song_info[1])
    song.artist_name = song_info[0]
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = []
  end

end
