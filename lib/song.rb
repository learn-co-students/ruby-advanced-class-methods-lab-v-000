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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name_lookup)
    self.all.detect{|song| song.name == name_lookup}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.uniq.sort{|a,b|
      if a.name > b.name
        1
      elsif a.name < b.name
        -1
      else
        0
      end
    }
  end

  def self.new_from_filename(file_name)
    artist_song_array = file_name.split("-")
    song = self.create_by_name(artist_song_array[1][0..-5].strip)
    song.artist_name = artist_song_array[0].strip
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end
