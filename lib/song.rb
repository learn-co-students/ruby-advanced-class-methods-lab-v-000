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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name  
    song  
  end 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new 
    title = filename.gsub(/\w+[^-]\z/, "")
    song.artist_name = title.scan(/\w+[^-]/)[0].strip
    song.name = title.scan(/\w+[^-]+\w+[^.]/)[1]
    song 
  end

  # Alternative self.new_from_filename solution 
  #
  # def self.new_from_filename(filename)
  #   title = filename.split(" - ")
  #   artist = title[0]
  #   song_name, extension = title[1].split(".")

  #   song = self.new 
  #   song.artist_name = artist 
  #   song.name = song_name 
  #   song 
  # end

  def self.create_from_filename(filename)
    song = self.create 
    title = filename.gsub(/\w+[^-]\z/, "")
    song.artist_name = title.scan(/\w+[^-]/)[0].strip
    song.name = title.scan(/\w+[^-]+\w+[^.]/)[1]
    song 
  end

  # Alternative self.create_from_filename solution
  
  # def self.create_from_filename(filename)
  #   title = filename.split(" - ")
  #   artist = title[0]
  #   song_name, extension = title[1].split(".")

  #   song = self.create 
  #   song.artist_name = artist 
  #   song.name = song_name 
  #   song 
  # end

  def self.destroy_all
    self.all.clear
  end
end