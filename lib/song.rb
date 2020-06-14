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
    song = Song.new #song = Song.create
    song.save #expect(song).to be_a(Song)
    song #expect(Song.all).to include(song)
  end

  def self.new_by_name(song_name)
    song = self.new #song = Song.new_by_name("Blank Space")
    song.name = song_name #expect(song.name).to eq("Blank Space")
    song
  end

  def self.create_by_name(song_name)
    song = self.create #song = Song.create_by_name("Blank Space")
    song.name = song_name #expect(song.name).to eq("Blank Space")
    song #expect(Song.all).to include(song)
  end

  def self.find_by_name(song_name)
    #song_1 = Song.create_by_name("Blank Space"), song_2 = Song.create_by_name("Hello"), song_3 = Song.create_by_name("Hotline Bling")
    self.all.detect { |song|
      song.name == song_name
    }#expect(Song.find_by_name("Hello")).to eq(song_2)
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song|
      song.name
    }
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ") #'initializes a song and artist_name based on the filename format'
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ") #'initializes and saves a song and artist_name based on the filename format'
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
