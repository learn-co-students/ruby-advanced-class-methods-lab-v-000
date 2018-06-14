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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    self.all << song
    return song
  end

  def self.find_by_name(song_name)
    self.all.detect do |track|
      track.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == nil
        create_by_name(song_name)
    else
      find_by_name(song_name)
    end
  end

  def self.alphabetical
    return self.all.sort_by do |song|
      song.name
    end
  end

 def self.new_from_filename(mp3_input)
     info = mp3_input.split(" - ")
     name = info[1].split(".mp3")
     song = self.new_by_name(name[0])
     song.artist_name = info[0]
     song
 end


 def self.create_from_filename(mp3)
   song = self.new_from_filename(mp3)
   song.save
   song

 end

 def self.destroy_all
   self.all.clear
 end

end
