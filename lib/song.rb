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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|item| item.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |word| word.name }
  end

  def self.new_from_filename(file)
    array = file.split(/ - /)
    song = new_by_name(array[1].split(".")[0])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file)
    array = file.split(/ - /)
    song = new_by_name(array[1].split(".")[0])
    song.artist_name = array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
