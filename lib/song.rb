class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def initialize(name)
  #   @name = name
  #   @@all << self
  # end

  def self.save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new
    song.name = name
    self.all.detect do |song|
      if song.name == name 
      else 
        @all << song
      end
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(mp3)
    mp3.chomp!(".mp3")
    data = mp3.split(" - ")
    artist_name = data[0]
    name = data[1]
    # Make a new instance
    song = self.new
    song.artist_name = artist_name
    song.name = name
    # Return the song
    song
  end

  def self.create_from_filename(mp3)
    mp3.chomp!(".mp3")
    data = mp3.split(" - ")
    artist_name = data[0]
    name = data[1]
    # Make a new instance
    song = self.new
    song.artist_name = artist_name
    song.name = name
    # Return the song
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end

end










