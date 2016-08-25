class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.all=(array)
    @@all = array
  end

  def save
    self.class.all << self
  end

  def self.create
    m = self.new
    m.save
    m
  end

  def self.new_by_name(name)
    m = self.new
    m.name = name
    m
  end

  def self.create_by_name(name)
    m = self.new
    m.name = name
    m.save
    m
  end

  def self.find_by_name(name)
    result = nil
      self.all.each do |x|
    result = x if x.name == name
    end
  result
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(name)
    first_split = name.split(/ - |\.mp3/)
    artist_name = first_split[0]
    name = first_split[1]
    new_song = create_by_name(name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(name)
    first_split = name.split(/ - |\.mp3/)
    artist_name = first_split[0]
    name = first_split[1]
    new_song = create_by_name(name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    self.all = []
  end

end
