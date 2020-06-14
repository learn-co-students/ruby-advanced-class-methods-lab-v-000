class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    @@all << self.new
    @@all[-1].name = name
    @@all[-1]
  end

  def self.find_by_name(name)
    @@all.detect{|p| p.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.detect{|p| p.name == name}
      @@all.detect{|p| p.name == name}
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort{|a,b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    arr=filename.split(/\s-\s|\.mp3/)
    song.name = arr[1]
    song.artist_name =arr[0]
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new
    arr=filename.split(/\s-\s|\.mp3/)
    @@all[-1].name = arr[1]
    @@all[-1].artist_name =arr[0]
    @@all[-1]
  end

  def self.destroy_all
    @@all=[]
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
