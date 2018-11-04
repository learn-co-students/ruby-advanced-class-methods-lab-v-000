class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


#----------------------------------------------- everything above was given


  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    false
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.new_from_filename(file)
    file = file.split(" - ")
    file[1] = file[1].slice(0..-5)
    new_song = Song.new
    new_song.name = file[1]
    new_song.artist_name = file[0]
    new_song
  end

  def self.create_from_filename(file)
    file = file.split(" - ")
    file[1] = file[1].slice(0..-5)
    new_song = Song.new
    new_song.name = file[1]
    new_song.artist_name = file[0]
    @@all << new_song
  end

  def self.destroy_all
    @@all = []
  end

  def self.alphabetical
    @@all.sort_by {|curr| curr.name}
  end

end


#for _from_filename: pop the last 4 chars (.mp3), split on "- ", << last index (the song name)
