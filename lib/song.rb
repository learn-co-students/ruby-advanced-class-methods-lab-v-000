class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all<<song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end  

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all<<song

    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        binding.pry
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    if @@all.count == 0
      self.create_by_name(name)
    else
      @@all.each do |x|
        if x.name = name
          return x
        else
          self.create_by_name
        end
      end
    end
  end

  def self.alphabetical
    alpha = @@all.sort_by{|x| x.name}
    alpha
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ").last.split(".mp3").first
    song.artist_name = filename.split(" - ").first
    song
    
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ").last.split(".mp3").first
    song.artist_name = filename.split(" - ").first
    @@all<<song
    song
  end

  def self.destroy_all
    @@all = []
  end




end
