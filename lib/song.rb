
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
    song.save
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
        self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(file_data)
    file_array = file_data.split(" - ")
    name = file_array[1].chomp!(".mp3")
    song = new_by_name(name)
    song.artist_name = file_array[0]
    song
    # binding.pry
  end
  def self.create_from_filename(file_data)
    file_array = file_data.split(" - ")
    name = file_array[1].chomp!(".mp3")
    song = create_by_name(name)
    song.artist_name = file_array[0]
    song
  end
  def self.destroy_all
    self.all.clear
  end
end







