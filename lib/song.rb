class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize
    
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

    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.all.detect{|song| song.name == name }
    else
      song = self.new
      song.name = name
      song

    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    name_array = file_name.scan(/\b[\w\s]+\b/)
    song = self.new
    song.name = name_array[1]
    song.artist_name = name_array[0]
    song
  end

  def self.create_from_filename(file_name)
    name_array = file_name.scan(/\b[\w\s]+\b/)
    song = self.new
    song.name = name_array[1]
    song.artist_name = name_array[0]
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end


end #Ends class Song
