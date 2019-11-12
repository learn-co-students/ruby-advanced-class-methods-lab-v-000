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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song= self.new
    song.name= name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song= self.new
    song.name= name
    @@all << song
    song
  end

  def self.find_by_name(name)
      @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    end
    self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    array = filename.split(/[-.]/)
    song= self.new
    song.artist_name= array[0].strip
    song.name= array[1].strip
    @@all << song
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(/[-.]/)
    song= self.new
    song.artist_name= array[0].strip
    song.name= array[1].strip
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end


end
