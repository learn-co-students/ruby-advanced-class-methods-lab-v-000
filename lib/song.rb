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
    song = self.new # initializes song
    song.save # Save your song
    song #Returns that song
  end

  def self.new_by_name(name)
    song = self.new # initializes song
    song.name = name #Assign name variable to the name of the song
    song #Returns that song
  end

  def self.create_by_name(name)
    song = self.new # initializes song
    song.name = name #Assign name variable to the name of the song
    song.save # Save your song
    song #Returns that song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    sorted_arr = @@all.sort_by { |song| song.name}
    sorted_arr
  end

  def self.new_from_filename(name)
    name.slice! (".mp3")
      data = name.split(" - ")
      artist_name = data[0]
      name = data[1]
      song = self.new
      song.name = name
      song.artist_name = artist_name
      song
  end

  def self.create_from_filename(name)
    name.slice! (".mp3")
      data = name.split(" - ")
      artist_name = data[0]
      name = data[1]
      song = self.new
      song.name = name
      song.artist_name = artist_name
      song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
