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
    is_there = self.find_by_name(name)
    if is_there == nil
      self.create_by_name(name)
    else
      is_there
    end
  end

  def self.alphabetical
     self.all.sort_by { |x| x.name}
   end

   def self.new_from_filename(name_with_mp3)
     s = self.new
     s.name = name_with_mp3.split(/[^a-zA-Z\s]|\s-\s/)[1]
     s.artist_name = name_with_mp3.split(/[^a-zA-Z\s]|\s-\s/)[0]
     s
   end

   def self.create_from_filename(name_with_mp3)
     i = self.new_from_filename(name_with_mp3)
     i.save
   end


  def self.destroy_all
    @@all.clear
  end

end
