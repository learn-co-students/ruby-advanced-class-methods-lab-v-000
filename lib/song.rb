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


  def self.new_by_name(name)
      song = self.new
      song.name = name
      song
    end

  def self.create_by_name(name)
    self.create.name = name
    self.all.last
  end

  def self.find_by_name(name)
    self.all.detect{|title| title.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
      self.all.sort_by {|instance| instance.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    artist = arr[0]
    name = arr[1]
    name = name[0...-4]
    song = self.new
    song.name = name
    # song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    arr = filename.split(" - ")
    artist = arr[0]
    name = arr[1]
    name = name[0...-4]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
