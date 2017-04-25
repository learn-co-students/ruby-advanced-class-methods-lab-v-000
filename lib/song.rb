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
# binding.pry
  def self.new_by_name(name) # I wrote more into this than was required by the test, which is why I just copy/pasted it and changed the method name below to #create_by_name
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    # binding.pry
    self.all.sort_by{|song| song.name}
  end

# Taylor Swift - Blank Space.mp3
  def self.filename_splitter(filename)
    filename_info = filename.split(' - ')
    filename_info[1].chomp!(".mp3")
    filename_info
  end

  def self.new_from_filename(filename)
    # song_info = filename.split(' - ')
    # song_info[1].chomp!(".mp3")
    # binding.pry
    filename_info = self.filename_splitter(filename)
    song = self.new_by_name(filename_info[1])
    song.artist_name = filename_info[0]
    song
  end

  def self.create_from_filename(filename)
    file_info = self.filename_splitter(filename)
    song = self.create_by_name(file_info[1])
    song.artist_name = file_info[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
