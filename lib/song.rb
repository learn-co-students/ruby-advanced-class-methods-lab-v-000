class Song
  attr_accessor :name, :artist_name
  @@songs = []

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@songs
  end

  def self.create(name = nil, artist_name = nil)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
    self
  end

  def self.create_by_name(name)
    self.name = name
    self.all << self
    self
  end

  def self.new_by_name(name)
    self.name = name
    self
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
