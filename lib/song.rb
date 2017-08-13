class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.new.save.last
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new.save.last
    s.name = name
    s
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    s = find_by_name(name)
    s ? s : create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_details = song_details_from_filename(filename)
    s = new_by_name(song_details.last)
    s.artist_name = song_details.first
    s
  end

  def self.create_from_filename(filename)
    song_details = song_details_from_filename(filename)
    s = create_by_name(song_details.last)
    s.artist_name = song_details.first
    s
  end

  def save
    self.class.all << self
  end

  private

  def self.song_details_from_filename(filename)
    filename.scan(/[^-][^(.mp3)]/).join.split(' - ')
  end
end
