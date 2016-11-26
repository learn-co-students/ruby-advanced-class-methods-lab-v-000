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
    new_song_instance = self.new
    @@all << new_song_instance
    new_song_instance
  end

  def self.create_by_name(song_name)
    new_song_instance = self.create
    new_song_instance.name = song_name
    new_song_instance
  end

  def self.new_by_name(song_name)
    new_song_instance = self.new
    new_song_instance.name = song_name
    new_song_instance
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.all.include?(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song_instance| song_instance.name}
  end

  def self.new_from_filename(filename)
    file_data = filename.split(" - ")
    artist_name = file_data[0]
    name = file_data[1].chomp(".mp3")

    new_song_instance = self.new_by_name(name)
    new_song_instance.artist_name = artist_name
    new_song_instance
  end

  def self.create_from_filename(filename)
    file_data = filename.split(" - ")
    artist_name = file_data[0]
    name = file_data[1].chomp(".mp3")

    new_song_instance = self.create_by_name(name)
    new_song_instance.artist_name = artist_name
    new_song_instance
  end

  def self.destroy_all
    @@all.clear
  end
end
