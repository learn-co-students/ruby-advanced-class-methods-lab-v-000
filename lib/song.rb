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
    x = self.new
    self.all << x
    x
  end

  def self.new_by_name(title)
    x = self.new
    x.name = title
    x
  end

  def self.create_by_name(title)
    checker = self.all.detect {|song| song.name == title}
    if !checker
      x = self.new
      x.name = title
      @@all << x
      x
    end
  end

  def self.find_by_name(title)
    self.all.detect{|songs| songs.name == title}
  end

  def self.find_or_create_by_name(title)
    self.create_by_name(title)
    self.find_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by {|word| word.name}
  end

  def self.new_from_filename(file)
    song_file = file.split(/[.-]/)
    holder = []
    song_file.each do |item|
      holder << item.strip
    end
    x = self.new
    x.name = holder[1]
    x.artist_name = holder[0]
    @@all << x
    x
  end

  def self.create_from_filename(file)
    song_file = file.split(/[.-]/)
    holder = []
    song_file.each do |item|
      holder << item.strip
    end
    x = self.new
    x.name = holder[1]
    x.artist_name = holder[0]
    @@all << x
    x
  end

  def self.destroy_all
    @@all = []
  end

end
