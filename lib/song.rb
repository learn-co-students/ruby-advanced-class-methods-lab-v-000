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
    s = new
    s.save
    s
  end

  def self.new_by_name(name)
    s = new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == name
      self.name
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by!(&:name)
  end

  def self.new_from_filename(filename)
    s = new
    parsed = File.basename(filename, ".mp3")
    parsed = parsed.partition(" - ")
    s.name = parsed[2]
    s.artist_name = parsed[0]
    s
  end

  def self.create_from_filename(filename)
    s = new
    parsed = File.basename(filename, ".mp3")
    parsed = parsed.partition(" - ")
    s.name = parsed[2]
    s.artist_name = parsed[0]
    s.save
    s
  end

  def self.destroy_all
    all.clear
  end

end
