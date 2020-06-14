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
    self.all.detect{|p| p.name == name}

  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
        self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical

    @@all.sort_by {|song| song.name}

  end

  def self.new_from_filename(words)
    arrays = []
    arrays = words.split(/ - /)
    array2 = arrays[1].split(".")

    song = self.new
    song.name = array2[0]
    song.artist_name = arrays[0]
    song
  end

  def self.create_from_filename(file)
    arrays = []
    arrays = file.split(/ - /)
    array2 = arrays[1].split(".")

    song = self.new
    song.name = array2[0]
    song.artist_name = arrays[0]
    @@all << song
    song
  end
  def self.destroy_all
    @@all.clear
  end



end
