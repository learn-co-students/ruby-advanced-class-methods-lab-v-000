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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name) # if the condition is not nil or false it is a truthy value
        self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end

  def self.alphabetical
    self.all.sort_by {|word| word.name.downcase }
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    name = split_filename[-1].chomp(".mp3")
    artist_name = split_filename[0]
    # binding.pry
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    something = self.new_from_filename(filename)
    @@all << something
  end

  def self.destroy_all
    self.all.clear
  end
end
