class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect{|song_object| song_object.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |a|
      a.name
    }
  end

  def self.new_from_filename(input)
    new_song = self.new

    arry = input.split(/[-\.]/)

    new_song.name = arry[1].strip
    new_song.artist_name = arry[0].strip
    new_song
  end

  def self.create_from_filename(input)
    new_song = self.new_from_filename(input)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
