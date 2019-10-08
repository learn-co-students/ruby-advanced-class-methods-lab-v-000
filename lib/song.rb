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
    x = self.new
    x.save
    x
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
     @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
          self.create_by_name(name)
      else
        self.find_by_name(name)
      end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end


  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song.save
    song
  end
  


  def self.destroy_all
    @@all.clear
  end



end
