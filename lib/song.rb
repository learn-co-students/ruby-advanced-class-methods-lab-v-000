class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    @name
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      if song.name == song_name
        song
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.all.detect {|song| song.name == song_name}
      self.all.detect do |song|
        if song.name == song_name
        song
        end
      end
    else
      song = self.new
      song.name = song_name
      song.save
      song
    end
  end

  def self.alphabetical
    self.all.sort_by!{|t| t.name}
  end

  def self.new_from_filename(song_name)
    array = []
    array = song_name.split(/\.|\s\-\s/)
    artist_name = array[0]
    song_name = array[1]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_name)
    array = []
    array = song_name.split(/\.|\s\-\s/)
    artist_name = array[0]
    song_name = array[1]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
