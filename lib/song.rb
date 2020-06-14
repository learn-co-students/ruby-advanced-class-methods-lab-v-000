class Song

  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name: "Unknown Song", artist: "Unknown Artist")
    self.name = name
    self.artist_name = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new.save
    self.get_last_song
  end

  def self.new_by_name(name)
    self.new(name: name)
  end

  def self.create_by_name(name)
    self.new(name: name).save
    self.get_last_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    temp = self.find_by_name(name)
    temp ||= self.create_by_name(name)
  end

  def self.get_last_song
    self.all[-1]
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_components = filename.split('-')
    song_components[0].strip!
    song_components[1].strip!
    self.new(name: (song_components[1])[0..-5], artist: song_components[0])
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
    self.get_last_song 
  end

  def self.destroy_all
    @@all = []
  end
end
