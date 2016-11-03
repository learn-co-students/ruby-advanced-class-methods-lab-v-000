class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    return self.all.detect {|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      return self.all.detect {|song_name| song_name.name == name}
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    return self.all.sort_by{|song| song.name }
  end

  def self.new_from_filename(file)
    song = Song.new
    song_file = file.split(" - ")
    song_name = song_file[1].split(".mp3")

    song.artist_name = song_file[0]
    song.name = song_name[0]

    return song
  end

  def self.create_from_filename(file)
    song = Song.new
    song_file = file.split(" - ")
    song_name = song_file[1].split(".mp3")

    song.artist_name = song_file[0]
    song.name = song_name[0]

    song.save

    return song
  end

  def self.destroy_all
    self.all.clear
  end

end
