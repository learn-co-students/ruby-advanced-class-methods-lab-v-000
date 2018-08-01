require "pry"

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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name== name}
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    split_file = file_name.split(/\s-\s|\.mp3/)
    song_object = self.new_by_name(split_file[1])
    song_object.artist_name=(split_file[0])
    song_object
    # binding.pry
  end

  def self.create_from_filename(file_name)
    split_file = file_name.split(/\s-\s|\.mp3/)
    song_object = self.create_by_name(split_file[1])
    song_object.artist_name=(split_file[0])
    song_object

    # Another way to wrtie above method in shorter form
    # song_object = self.new_from_filename(file_name)
    # song_object.save
    # song_object
  end

  def self.destroy_all
    self.all.clear
  end
end
