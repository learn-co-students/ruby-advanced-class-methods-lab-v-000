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

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    artist = array[0]
    song_name = array[1].split(".")[0]
    song=self.new
    song.name = song_name
    song.artist_name = artist


    song.save

    
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
  
  def self.new_from_filename(filename)
  array = filename.split(" - ")
  artist = array[0]
  song_name = array[1].split(".")[0]
  song=self.new
  song.name = song_name
  song.artist_name = artist
  song

    
  end
   def self.find_or_create_by_name(name)
  
    if @@all.include?(name)
       @@all.find? do |song|
         song.name==name
       end
    else
      song=self.new
      song.name = name
      @@all << self
      song
      end
    end

  def self.destroy_all
    self.all.clear
   end
end

