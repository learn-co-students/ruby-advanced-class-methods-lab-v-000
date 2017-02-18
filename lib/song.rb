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
    song.name = ""
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
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.detect{|song| song.name == name} == true
      song
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    split_up_file = filename.chomp('.mp3').split(" - ")
    artist_name = split_up_file[0]
    name = split_up_file[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split_up_file = filename.chomp('.mp3').split(" - ")
    artist_name = split_up_file[0]
    name = split_up_file[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
