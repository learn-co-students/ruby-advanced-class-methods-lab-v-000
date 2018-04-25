require'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save   #song.save
    self.class.all << self     #def name=(name) @name = name  end  def name @name  end
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name === name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

   def self.alphabetical
     self.all.sort do |song_1, song_2|
       song_1.name <=> song_2.name
     end
   end

   def self.new_from_filename(filename)
     song_info = filename.split(".mp3")[0]
     artist_song = song_info.split(" - ")
     name = artist_song[1]
     artist_name = artist_song[0]

     song = self.new
     song.name = name
     song.artist_name = artist_name
     song
   end

   def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
   end

   def self.destroy_all
     self.all.clear
   end

end
