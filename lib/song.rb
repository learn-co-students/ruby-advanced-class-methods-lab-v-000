class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name = nil, artist_name = nil)
    @name = name if name
    @artist_name = artist_name if artist_name
  end

  def self.create
    song = self.new
    self.all << song # better: song.save
    song
  end

  def self.new_by_name(name)
    song = self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|title| title.name == name}
  end

  # def self.find_or_create_by_name(name)
    # if self.all.include?(name)
      # self.song.find_by_name(name)
    # else
      # self.create_by_name(name)
    # end
  # end <-- THIS METHOD PASSED TEST BUT IS INCORRECT, REFACTORS IN LINES 46-48

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end 

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end


  #def self.new_from_filename(song_name)
    #if song_name.include?(".mp3")
      #song = self.new
      #artist_and_song_array = song_name.split(" - ")
      #song.name = artist_and_song_array[1].chomp(".mp3")
      #song.artist_name = artist_and_song_array[0]
      #song
    #end
  #end

  def self.new_from_filename(filename) # REFACTOR OF LINES 55-63 TO MAKE VARIABLE NAMES MORE EXPLICIT
    if filename.match(/.mp3/)
      filename = filename.split(" - ")
      title = filename[1].chomp(".mp3")
      artist = filename[0]
      song = self.new
      song.name = title
      song.artist_name = artist
      song
    end
  end


  def self.create_from_filename(song_name)
    if song_name.include?(".mp3")
      song = self.new
      artist_and_song_array = song_name.split(" - ")
      song.name = artist_and_song_array[1].chomp(".mp3")
      song.artist_name = artist_and_song_array[0]
      self.all << song
      song
    end
  end

  def self.destroy_all
    self.all.clear
  end

end