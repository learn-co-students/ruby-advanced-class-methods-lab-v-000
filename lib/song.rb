class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
   song = Song.new
   song.save
   song
  end

  def self.new_by_name(name)
    song = create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = create
    song.name = name
    song
  end


  def save
    self.class.all << self
  end

def self.find_by_name(name)
  @@all.detect{|song| song.name == name}
end

def self.find_or_create_by_name(name)
song = @@all.detect{|song| song.name == name}
if song == nil
  song=create_by_name(name)
end
song
end

def self.alphabetical
  @@all.sort_by { |song| song.name}
  end

def self.new_from_filename(songname)
  str=songname.split(" - ")
  song=create
  song.artist_name = str[0].chomp
  index= str[1].index('.mp3')-1
  song.name= str[1][0..index]
  song
end

def self.create_from_filename(songname)
  str=songname.split(" - ")
  song=create
  song.artist_name = str[0].chomp
  index= str[1].index('.mp3')-1
  song.name= str[1][0..index]
  song
end
def  self.destroy_all
@@all=[]
end
end
