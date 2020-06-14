class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.find { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    if song = find_by_name(name)
      return song
    else
      create_by_name(name)
    end
  end
  
  def <=> (other) #1 if self>other; 0 if self==other; -1 if self<other
    self.name <=> other.name
  end

  
  def self.alphabetical
    self.all.sort
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    a = filename.split (" - ")
    artist_name = a.first
    song_name = a.last.gsub!(".mp3", "")
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end




song = Song.create
puts Song.all.include?(song)

song = Song.new_by_name("The Middle")
puts song.name

song = Song.create_by_name("The Middle")
puts Song.all.inspect
puts Song.all.include?(song)