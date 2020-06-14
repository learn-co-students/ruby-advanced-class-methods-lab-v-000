class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    #@@all << song
    song.save
    song
  end

  def self.all
    @@all
  end

  def save #add instance to @@all array
    self.class.all << self
  end

  def self.new_by_name(name_string)
    song = Song.new
    song.name = name_string
    song
  end

  def self.create_by_name(songname)
    song = Song.new
    song.name = songname
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.detect {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      song_1 = self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    ary = self.all.sort_by! {|x| x.name.downcase}
    ary

  end

  def self.new_from_filename(name) 
    filename = name.chomp(".mp3").split(" - ")
    
    newsong = Song.new_by_name(filename[1])
    newsong.artist_name = filename[0]
    newsong

  end

  def self.create_from_filename(ex)
    newsong = Song.new_from_filename(ex)
    newsong.save

  end

  def self.destroy_all
    self.all.clear
  end

end
