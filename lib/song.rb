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
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|title| title.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist, song = filename.split(' - ')
    new_song = song.gsub('.mp3', '')

    song = new_by_name(new_song)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    artist, song = filename.split(' - ')
    new_song = song.gsub('.mp3', '')

    song = create_by_name(new_song)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
