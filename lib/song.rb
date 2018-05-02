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
    newsong = self.new
    self.all << newsong
    newsong

  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    self.all << s
    s
  end

  def self.find_by_name(name)
    self.all.detect do |instance|
      instance.name == name
    end
  end

  def self.find_or_create_by_name(name)
    is_it_there = self.find_by_name
      if is_it_there == nil
        self.create_by_name
      else
        is_it_there
      end
  end



  def self.destroy_all
    @@all.clear
  end

end
