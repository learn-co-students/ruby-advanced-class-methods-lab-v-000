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

  def initialize(name = nil)
    @name = name
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new(name)
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
         create_by_name(name)
        #  binding.pry
      end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    # file == Thundercat - For Love I Come.mp3"
    # 'Thundercat' is the artist name, 'For Love I come' is the song name
    # i would recommend gsub for removing .mp3, and split for removing the ' - '
    file2 = file.split(/\-|\./)
    artist = file2[0].strip
    song_name = file2[1].strip

    song = self.new
    song.artist_name = artist
    song.name = song_name
    song
  end

  def self.create_from_filename(file_name)
    new_file = new_from_filename(file_name)
    new_file.save
  end

  def self.destroy_all
    @@all.clear
  end

end
