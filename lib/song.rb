
require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    s = self.new
    s.save
    s
  end
  def self.create_by_name(string_name)
    s = self.new
    s.name = string_name
    s.save
    s
  end
  def self.new_by_name(string_name)
    s = self.new
    s.name = string_name
    s
  end
  def self.find_by_name(string_name)
    self.all.detect {|i| i.name == string_name}
  end
  def self.find_or_create_by_name(string_name)
   self.find_by_name(string_name) || self.create_by_name(string_name)
  end
 def self.alphabetical
   @@all.sort_by{|n| n.name}
 end
 def self.new_from_filename(string_name)
   array = string_name.split("-")
   song_name = array[1].chomp(".mp3").strip
   s = self.new_by_name(song_name)
   s.artist_name = array[0].strip
   s
 end
 def self.create_from_filename(string_name)
   array = string_name.split("-")
   song_name = array[1].chomp(".mp3").strip
   s = self.new_by_name(song_name)
   s.artist_name = array[0].strip
   s.save
   s
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
