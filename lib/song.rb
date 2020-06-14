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
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    match = nil
    @@all.each do |song|
      if song.name == song_name
        match = song
      end
    end
    match
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    elements = filename.split(" - ")
    artist_name = elements[0]
    song_name = elements[1]
    song = self.new
    song.artist_name = artist_name
    just_name = song_name.split(".")
    song.name = just_name[0]
    song
  end

  def self.create_from_filename(filename)
    elements = filename.split(" - ")
    artist_name = elements[0]
    song_name = elements[1]
    song = self.create
    song.artist_name = artist_name
    just_name = song_name.split(".")
    song.name = just_name[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
