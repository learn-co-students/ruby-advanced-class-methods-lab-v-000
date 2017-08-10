class Song
  attr_accessor  :artist_name, :name

  @@all = []

  def self.all
    @@all
  end

  def save
    Song.all << self
  end

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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        song
      end
    end
  end

  def self.find_or_create_by_name(name)
    if !Song.find_by_name(name)
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(name)

    array = name.split(" - ")
    title = array[1].split(".")
    song = self.new_by_name(title[0])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
