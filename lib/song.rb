class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    @@all << song
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def Song.find_by_name(name)
    self.all.detect{|song|song.name == name}
  end

  def Song.find_or_create_by_name(name)
    if self.all.detect{|song|song.name == name} == nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def Song.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def Song.new_from_filename(filename)
    song = self.new
    array = filename.split(/[.-]/)
    song.artist_name = array[0].strip
    song.name = array[1].strip
    song
  end

  def Song.create_from_filename(filename)
    song = self.new
    array = filename.split(/[.-]/)
    song.artist_name = array[0].strip
    song.name = array[1].strip
    @@all << song
    song
  end

  def Song.destroy_all
    @@all = []
  end

end



