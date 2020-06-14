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
    self.new.save
    self.all[-1]
  end

  def self.new_by_name(song_name)
    #@name=name
    song=self.new
    song.name=song_name
    song
  end

  def self.create_by_name(song_name)
    song=self.new
    song.name=song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name==song_name}
  end

  def self.find_or_create_by_name (song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |m| m.name }
  end

  def self.new_from_filename (filename)
    elements=filename.split(" - ")
    artist_name=elements[0]
    song_name=elements[1].gsub(".mp3","")
    #artist_name=elements[0]
    #song_name=elements_song[0]

    song=self.new
    song.name=song_name
    song.artist_name=artist_name
    song

  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
