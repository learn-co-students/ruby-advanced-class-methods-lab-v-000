class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @song = self.new
    @@all << @song
    @song
  end

  def self.new_by_name(name)
    xsong = self.new
    xsong.name = name
    xsong
  end

  def self.create_by_name(name)
    xsong = self.new
    xsong.name = name
    xsong.save
    xsong
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|x| x.name }
  end


  def self.new_from_filename(filename)
    #parse artist separately then save only the song
    extension = filename.scan(/\b\.\w*/)
    no_mp3 = filename.chomp(extension.join)
    splitted = no_mp3.split(" - ")

    song_name = splitted[1]
    song_artist = splitted[0]

    song = Song.new
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end


  def self.destroy_all
    self.all.clear
  end

end
