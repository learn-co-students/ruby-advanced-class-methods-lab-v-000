class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
   song=self.new
   self.all << song
   song
   
  end

  def self.new_by_name(name)
    song=self.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song=self.new
    song.name = name
    @@all << song 
    song
  end

  def self.create_from_file_name(file_name)
    self.from_file_name(file_name)
  end

  def self.find_by_name(name)
    @@all.detect{|x| x.name==name}
  end

  def self.alphabetical
   self.all.sort_by { |song| song.name}
  end

  def self.all
    @@all 
  end

  def save
    self.class.all << self
  end
  def self.new_from_filename(name)
    artist = ""
    song = ""
    data = filename.scan(/(.+)\s\-\s(.+)\.mp3/)
    artist = data[0][0]
    song = data[0][1]
    self.create(song,artist)
    
  end
   def self.find_or_create_by_name(name)
    song = self.find_or_create_by_name(name)
    song = self.create_by_name(name)
   end

  def self.destroy_all
    self.all.clear
  end

end
