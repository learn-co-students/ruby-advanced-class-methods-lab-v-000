class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name="")
    @name = name
    @artist_name = ""
  end
  
  def save()
    @@all << self
  end
  
  def self.create()
    song = Song.new()
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new(name)
    @@all << song
    song  
  end
  
  def self.alphabetical()
    @@all.sort_by
  end
  
  def self.create_by_name(name)
    song = Song.new(name)
    @@all << song
    song  
  end
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return false
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == false
      create_by_name(name)
    else
      find_by_name(name)
    end
  end
  
  def self.new_from_filename(file_name)
    file_name = file_name.split(" - ")
    song_name = file_name[1].split(".")[0]
    song = Song.new(song_name)
    song.artist_name = file_name[0]
    song
  end
  
  def self.create_from_filename(file_name)
    file_name = file_name.split(" - ")
    song_name = file_name[1]
    song = Song.new(song_name)
    song
  end
  
  def self.destroy_all()
    @@all = []
  end

end
