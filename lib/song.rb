class Song
  attr_accessor :name, :artist_name
  @@all = [] #stores the instance records

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new  #Creates a song (Song.new)
    self.all << song #Adds song (<<) to the @@all array via self.all
    song             #returns newly created song's object notation
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name=(name)
    new_song
  end

  def self.create_by_name(name)
    created_song = self.create
    created_song.name = name
    created_song
  end

  def self.find_by_name(name)
    @@all.detect{|s_name| s_name.name == name}
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name) == nil #if song can't be found in @@all
      self.create_by_name(name)       #
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song_object|song_object.name[0]}
  end


  def self.new_from_filename(filename)
    new_song = self.new
    new_song.artist_name = filename.split(" - ")[0]
    new_song.name = filename.split(" - ")[1].split(".")[0]

    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.create
    new_song.artist_name = filename.split(" - ")[0]
    new_song.name = filename.split(" - ")[1].split(".")[0]

    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
