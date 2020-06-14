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
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) unless self.find_by_name(name) == true
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(file_name)
    info = file_name.split(" - ")
    artist_name = info[0]
    song_name = info[1].gsub(/\a\s|\.\w+/, "")
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    self.all.clear
  end
end