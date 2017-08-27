class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def initialize(name)
  #   @name = name
  #   self.class.all << self
  # end

  def self.create
   song = self.new
   self.all << song
   song
 end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by! {|title| title.name}
  end

  def self.new_from_filename(file)
    song_artist_arr = filename.split(/\s[-]\s|.mp3/)
    new_song = self.new
    new_song.artist_name = song_artist_arr[0]
    new_song.name = song_artist_arr[1]
    new_song
  end

  def self.create_from_filename(file)
    new_song = new_from_filename(file)
    self.all << new_song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
