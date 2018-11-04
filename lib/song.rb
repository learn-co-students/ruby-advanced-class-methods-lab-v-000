class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    song = self.all.find {|song| song.instance_variable_get(:@name) == name} if true
    song
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(find_by_name(name))
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.instance_variable_get(:@name)}
  end

  def self.new_from_filename(filename)
    song_arr = filename.chomp(".mp3").split(" - ")
    song_ins = Song.new_by_name(song_arr[1])
    song_ins.artist_name = song_arr[0]
    song_ins
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
