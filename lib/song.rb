class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  private

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_by_name = self.new
    new_by_name.name = name
    new_by_name
  end

  def self.create_by_name(name)
    created_by_name = self.new
    created_by_name.name = name
    created_by_name.save
    created_by_name
  end

  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    songs = self.find_by_name(name)
    songs ? songs : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    split_file = filename.split('-')
    new_song = self.new_by_name(split_file[1].strip.chomp(".mp3"))
    new_song.artist_name = split_file[0].strip
    new_song
  end

  def self.create_from_filename(filename)
    split_file = filename.split('-')
    new_song = self.new_by_name(split_file[1].strip.chomp(".mp3"))
    new_song.artist_name = split_file[0].strip
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
