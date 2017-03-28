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
    current_song = self.new
    current_song.save
    current_song
  end

  def self.new_by_name(new_song)
    song = self.new
    song.name=new_song
    song
  end

  def self.create_by_name(new_song)
    song=  self.new_by_name(new_song)
    song.save
    song
  end

  def self.find_by_name(name)
    song = nil
    @@all.each do |songs|
       song = songs if songs.name == name

    end
    song
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|left,right|
      left.name <=> right.name
    }
  end

  def self.new_from_filename(file_name)
    items = file_name.split("-")
    artist = items[0].strip
    song = items[1].strip.split(".").shift

    new_song = self.new
    new_song.name=song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
