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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song_name| song_name.name}
  end

  # Refactored #new_from_filename method  
  def self.new_from_filename(filename)
    # Filename format is: "Artist Name - Song Name.mp3"
    data = filename.split(/\s\-\s|\./)
    song = self.new_by_name(data[1])
    song.artist_name = data[0]
    song
  end
  
  # Refactored #create_from_filename method
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  # Old code for #new_from_filename and #create_from_filename methods
  
  # def self.new_from_filename(filename)
  #   a = filename.split(" - ")
  #   song = self.new
  #   song.name = a[1].gsub('.mp3','')
  #   song.artist_name = a[0]
  #   song
  # end
  
  # def self.create_from_filename(filename)
  #   a = filename.split(" - ")
  #   song = self.new
  #   song.name = a[1].gsub('.mp3','')
  #   song.artist_name = a[0]
  #   song.save
  #   song
  # end

  def self.destroy_all
    self.all.clear
  end
end
