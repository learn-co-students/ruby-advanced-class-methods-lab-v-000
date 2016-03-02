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
    self.all << song = self.new
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.detect{|t| t.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.all.include?(self.find_by_name(title))
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by{|t| t.name}
  end

  def self.new_from_filename(music_file)
    data = music_file.split(" - ")
    artist_name = data[0]
    title_and_file = data[1].split(".")
    title = title_and_file[0]
    file = title_and_file[1]

    song = self.new_by_name(title)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(music_file)
    data = music_file.split(" - ")
    artist_name = data[0]
    title_and_file = data[1].split(".")
    title = title_and_file[0]
    file = title_and_file[1]

    song = self.create_by_name(title)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all = []
  end
end
