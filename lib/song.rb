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
    song.name = @name
    song.artist_name = @artist_name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    @name = name
    self.create
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.chomp!('.mp3')
    data = filename.split(' - ')
    @name = data[1]
    @artist_name = data[0]
    song = self.new
    song.name = @name
    song.artist_name = @artist_name
    song
  end

  def self.create_from_filename(filename)
    filename.chomp!('.mp3')
    data = filename.split(' - ')
    @name = data[1]
    @artist_name = data[0]
    self.create
  end

  def self.destroy_all
    @@all.clear
  end

end
