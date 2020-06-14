class Song
  attr_accessor :name, :artist_name
  attr_reader :song

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	song = Song.new
  	song.save
  	song
  end

  def self.new_by_name(song_name)
  	song = self.new
  	song.name = song_name
  	song
  end

  def self.create_by_name(song_name)
  	song = self.create
  	song.name = song_name
  	song
  end

  def self.find_by_name(song_name)
  	self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
  	!self.find_by_name(song_name) ? self.create_by_name(song_name) : self.find_by_name(song_name)
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(song_info)
  	info = song_info.split(/\s-\s|\./)
  	artist_name = info[0]
  	song_name = info[1]

  	song = self.new
  	song.name = song_name
  	song.artist_name = artist_name
  	song
  end

  def self.create_from_filename(song_info)
	info = song_info.split(/\s-\s|\./)
  	artist_name = info[0]
  	song_name = info[1]

  	song = self.create
  	song.name = song_name
  	song.artist_name = artist_name
  	song
  end

  def self.destroy_all
  	self.all.clear
  end

end
