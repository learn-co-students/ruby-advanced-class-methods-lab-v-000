class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.new_by_name(title)
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.find {|x| x.name == title}
  end


  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)
    if song
    else
      song = self.create_by_name(title)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.name = file_name.split(/ - |.mp3/)[1]
    song.artist_name = file_name.split(/ - |.mp3/)[0]
  end

  def self.create_from_filename(file_name)
    song = self.create
    song.name = file_name.split(/ - |.mp3/)[1]
    song.artist_name = file_name.split(/ - |.mp3/)[0]
  end

  def self.destroy_all
    self.all.clear
  end
end
