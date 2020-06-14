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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song= self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
      self.all.detect {|that_song| that_song.name == name}
    end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
  self.all.sort_by{|each_song| each_song.name}
 end

 def self.new_from_filename(filename)
   filename.chomp!(".mp3")
   file = filename.split(" - ")
   artist_name = file[0]
   name = file[1]
   song = self.new
   song.name = name
   song.artist_name = artist_name
   song
end

 def self.create_from_filename(filename)
    filename.chomp!(".mp3")
    file = filename.split(" - ")
    artist_name = file[0]
    name = file[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all<<song
  end

 def self.destroy_all
   self.all.clear
 end


end
