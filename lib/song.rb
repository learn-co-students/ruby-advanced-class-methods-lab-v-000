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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        return song
      end
    end

  end
  def self.find_or_create_by_name(name)
     self.create_by_name(name)

  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(name)

    separate = name.split("-")

    name = separate[0]
    title = separate[1]

    person = self.new
    person.artist_name = name.rstrip
    person.name = title.chomp(".mp3").lstrip
    person

  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end
  def self.destroy_all
    self.all.clear
  end

end
