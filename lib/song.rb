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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_by_name_song = self.new
    new_by_name_song.name = name
    new_by_name_song
  end

  def self.create_by_name(name)
    create_by_name_song = self.create
    create_by_name_song.name = name
    create_by_name_song
  end

  def self.find_by_name(name)
    matching_song = nil
    @@all.each do |song|
      if song.name == name
        matching_song = song
      end
    end
    matching_song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(string)
    arr = string.split(" - ")
    artist = arr[0]
    name = arr[1]
    name.sub!(".mp3", "")

    new_song = self.create_by_name(name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(string)
    new_song = self.new_from_filename(string)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
