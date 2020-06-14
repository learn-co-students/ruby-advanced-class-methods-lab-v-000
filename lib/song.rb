class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(song_name = nil)
    song = self.new_by_name(song_name)
    song.save
    song
  end
  def self.new_by_name(song_name = nil)
    song = Song.new
    song.name = song_name
    song
  end
  def self.create_by_name(song_name)
    self.create(song_name)
  end
  def self.find_by_name(song_name)
    self.all.each do |song|
      if song.name == song_name
        return song
      end
    end
    return nil
  end
  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if(song == nil)
      song = self.create_by_name(song_name)
    end
    song
  end
  def self.alphabetical
    sorted_songs = []
    temp_song = nil
    swapped = true
    current_position = 0
    size = self.all.size
    sorted_songs = self.all
    while swapped
      swapped = false
      current_position += 1
      for x in 0..(size - current_position - 1)
        if(sorted_songs[x].name > sorted_songs[x+1].name)
          temp_song = sorted_songs[x]
          sorted_songs[x] = sorted_songs[x+1]
          sorted_songs[x+1] = temp_song
          swapped = true
        end
      end
    end
    sorted_songs
  end
  def self.new_from_filename(filename)
    split = filename.split(" - ")
    artist_name = split[0]
    song_name = split[1].split(".mp3")[0]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  def self.destroy_all
    self.all.clear
  end
end

Song.create_by_name("Boo")
Song.find_or_create_by_name("Turk")
puts Song.alphabetical
