class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}.each{|song| puts "#{song.name}"}
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name)? find_by_name(name) : create_by_name(name)
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.new_from_filename(filename)
    fileparts = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.artist_name = fileparts[0]
    song.name = fileparts[1]
    song
  end


  def save
    self.class.all << self
  end

end
