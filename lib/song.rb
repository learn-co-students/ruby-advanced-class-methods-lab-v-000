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
    song = self.create
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    song = self.all.detect { | song | song.name == name}
    song
  end

  def self.find_or_create_by_name(name)

    val = self.all.detect do | song |
      song.name == name
    end
    if val.class != nil
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    arr = self.all.sort_by do | song |
      song.name
    end
    arr.uniq
  end

  def self.new_from_filename(filename)
    song_data_array = filename.split(/[\s][-][\s]|\./)
    song = self.new_by_name(song_data_array[1])
    song.artist_name = song_data_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
