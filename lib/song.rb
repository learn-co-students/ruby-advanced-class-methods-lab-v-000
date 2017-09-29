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
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    file_name = filename.split(/\s\-\s|\./)
    song = self.new
    song.artist_name = file_name[0]
    song.name = file_name[1]
    song
  end

  def self.create_from_filename(filename)
    file_name = filename.split(/\s\-\s|\./)
    song = self.new
    song.artist_name = file_name[0]
    song.name = file_name[1]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end

#song_1 = Song.create_by_name("Lemonade")
#song_2 = Song.create_by_name("Hello")
#song_3 = Song.create_by_name("Blank Space")
#song_4 = Song.create_by_name("Banana Pancake")
#song_5 = Song.create_by_name("Locked Out of Heaven")
#Song.alphabetical
