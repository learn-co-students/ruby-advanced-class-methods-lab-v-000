require 'pry'

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
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[-1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

  #describe '.create_from_filename' do
  #  it 'initializes and saves a song and artist_name based on the filename format' do
  #    song = Song.create_from_filename("Thundercat - For Love I Come.mp3")
  #    song_match = Song.find_by_name("For Love I Come")
  #    expect(song_match.name).to eq("For Love I Come")
  #    expect(song_match.artist_name).to eq("Thundercat")
  #  end
  #end

  def self.destroy_all
      self.all.clear
  end

end
