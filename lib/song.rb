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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    return self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1]= song_array[1].chomp(".mp3")

    new_song = self.new_by_name(song_array[1])
    new_song.artist_name = song_array[0]
    return new_song
  end

  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1]= song_array[1].chomp(".mp3")

    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
