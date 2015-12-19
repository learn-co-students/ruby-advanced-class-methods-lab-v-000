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
    @@all << song
    return song
  end
  
  def self.new_by_name (name_album)
    song   = self.new
    song.name = name_album
   song 
  end
  
  def self.create_by_name (name_song)
    song = self.new
    song.name = name_song
    @@all << song
    song 
  end
  
  def self.find_by_name(name_song)
    Song.all.each do |song|
    if song.name==name_song
      return song 
    end
  
                   end
  end
  
  def self.find_or_create_by_name(song_name)
    if Song.all.include?(song_name)
         Song.all.each do |song|
          if song.name==name_song
           return song 
          end
                   end
    else
      song = self.new
      song.name = song_name
       @@all << song
       song 
    end
  end
  
  def self.alphabetical
    Song.all.sort_by {|songs| songs.name}
  end
  
  def self.new_from_filename(filename)
    a=filename.gsub(".mp3","").split(" - ")
    song=self.new_by_name(a[1])
    song.artist_name=a[0]
    song
  end
  
  def self.create_from_filename(filename)
     a=filename.gsub(".mp3","").split(" - ")
    song=self.new_by_name(a[1])
    song.artist_name=a[0]
     @@all << song 
    song
  end
  
  def self.destroy_all
    @@all.clear 
  end
end
