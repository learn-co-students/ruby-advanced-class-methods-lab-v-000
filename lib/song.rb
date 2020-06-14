class Song
  attr_accessor :name, :artist_name
  @@all = ["One", "Two"]

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
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name) != nil
        self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    song = self.new
    name.chomp!(".mp3")
    name.delete! "-"
    array = name.split(/\s\s/)
    song.name = array[1]
    song.artist_name = array[0]
    song

  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
