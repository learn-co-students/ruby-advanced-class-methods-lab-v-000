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
    song= self.new
    song.save
    song
    # binding.pry
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
    # binding.pry
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if(self.find_by_name(name) != nil)
      song = self.find_by_name(name)
    else
      song = self.new
      song.name = name
      song.save
    end
    song
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    fnm = filename
    artist = filename.scan(/[a-zA-Z\s]{1,30}-/)[0]
    artist = artist.sub(' -','')
    nm = filename.scan(/-+[a-zA-Z\s]{1,25}.mp3/)[0]
    nm = nm.gsub(/- |.mp3/,'')
    # binding.pry
    song = self.new
    song.name = nm
    song.artist_name = artist
    song.save
    song
  end

  def self.create_from_filename(filename)
    artist = filename.scan(/[a-zA-Z\s]{1,30}-/)[0]
    artist = artist.sub(' -','')
    name = filename.scan(/-+[a-zA-Z\s]{1,25}.mp3/)[0]
    name = name.gsub(/- |.mp3/,'')
    song = self.new
    song.name = name
    song.artist_name = artist
    binding.pry
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
