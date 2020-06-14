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
    song = self.new #new object
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
    self.all.find do |song| song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song| song.name
    end
  end

  def self.new_from_filename(filename)
    song = self.new
    info =  filename.chomp(".mp3").split(" - ")
    song.name = info[1]
    song.artist_name = info[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save

  end

  def self.destroy_all
    self.all.clear
  end



end
