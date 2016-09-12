require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "name")
    @name = name
    if self.name.include?(" - ")
      self.name = self.name.split(" - ")
      self.name[1] = self.name[1].split(".")
      self.name[1] = self.name[1][0]
      self.artist_name = self.name[0]
      self.name = self.name[1]
    end
    save
  end

  def self.create
    song = self.new
  end

  def self.new_by_name(name)
    song = self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
  end

  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new(name)
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(name)
    song = self.new(name)
  end

  def self.create_from_filename(name)
    song = self.new(name)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end
