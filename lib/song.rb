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
    song = Song.new
    self.all << song 
    song 
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    self.all << song 
    song 
  end


  def self.create_by_name(name)
    song = Song.new
    song.name = name 
    self.all << song 
    song
  end

  def self.find_by_name(song)
    self.all.detect { |item| item.name == song }
  end

  def self.find_or_create_by_name(song)
    self.create_by_name(song) 
  end

  def self.alphabetical
    self.all.sort_by! { |el| el.name }
  end

  def self.new_from_filename(song_name)
    data = song_name.split(/\-|\./).map { |el| el.strip || el }.select { |el| el.length > 3 }

    item = Song.new 
    item.name = data.last
    item.artist_name = data.first 
    item 

  end

  def self.create_from_filename(song_name)
    item = self.new_from_filename(song_name)
    item.save
  end

  def self.destroy_all
    self.all.clear 
  end


end
