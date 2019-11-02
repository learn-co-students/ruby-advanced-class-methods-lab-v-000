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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort do |song_1, song_2|
      song_1.name <=> song_2.name
    end
  end

  def self.new_from_filename(filename)
    filename_arr = filename.chomp('.mp3').split('-')
    artist_name = filename_arr[0].strip
    song_name = filename_arr[1].strip

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    filename_arr = filename.chomp('.mp3').split('-')
    artist_name = filename_arr[0].strip
    song_name = filename_arr[1].strip

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
