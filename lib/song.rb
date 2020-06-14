require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    a = Song.new
    a.save
    return a
  end

  def self.new_by_name(title)
    b = Song.new
    b.name = title
    return b
  end

  def self.create_by_name(title)
    c = Song.new
    c.name = title
    c.save
    return c
  end

  def self.find_by_name(title)
    @@all.detect {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if @@all.include?(title) == false
      create_by_name(title)
    else @@all.detect {|song| song.name == title}
    end
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    a = filename.split('-')
      artist_name_calc = a[0].rstrip
    t = a[1].split('.')
      name_calc = t[0].strip
    s = self.create_by_name(name_calc)
    s.artist_name = artist_name_calc
    s.save
    return s
#    binding.pry
  end

  def self.create_from_filename(filename)
    a = filename.split('-')
      artist_name_calc = a[0].rstrip
    t = a[1].split('.')
      name_calc = t[0].strip
    s = self.create_by_name(name_calc)
    s.artist_name = artist_name_calc
    s.save
    return s
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
