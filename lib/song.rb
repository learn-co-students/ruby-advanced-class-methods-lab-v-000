class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    found = @@all.detect {|i| i.name == name} 
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found == nil
      return self.create_by_name(name)
    end
    found
  end


  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(filename)
    filename = filename.split(' - ')
    song = self.new
    song.artist_name = filename[0]
    song.name = filename[1].gsub(".mp3", "")
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
