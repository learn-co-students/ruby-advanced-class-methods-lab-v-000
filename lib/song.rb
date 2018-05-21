require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create 
    s = self.new 
    s.save 
    s
  end 
 
  def self.create_by_name(string_name_of_the_song)
    s = self.new 
    s.name = string_name_of_the_song
    s.save 
    s
  end
 
  def self.new_by_name(string_name_of_the_song)
    s = self.new 
    s.name = string_name_of_the_song
    s
  end 
  
  def self.find_by_name(string_name_of_the_song) 
    self.all.detect {|i| i.name == string_name_of_the_song}
  end
  
  def self.find_or_create_by_name(find_this_song)
    did_i_find_it = self.all.detect {|x| x.name == find_this_song}
    if did_i_find_it == nil
      s = self.new 
      s.name = find_this_song
      s.save 
      s
    else
      did_i_find_it
    end
  end 

  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 
  
  def self.new_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end 
  
  def self.create_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end 
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
 
end

zaza = Song.create
zaza.name = "Sugar Zaza"
zaza.artist_name = "Shoshi"

loon = Song.create
loon.name = "Moon Landing"
loon.artist_name = "Major Tom"

Song.all

song = Song.create
song.name = "Haunted House"
Song.all.include?(song)

song2 = Song.new_by_name("The Middle")
song2.name #=> "The Middle"
song2

song3 = Song.create_by_name("Banjo-Song")
song3
song3.artist_name = "Redneck Dude"
Song.all.include?(song3)

Song.find_by_name("Banjo-Song")

song5 = Song.find_or_create_by_name("Banjo-Song")
Song.all

song_6 = Song.find_or_create_by_name("Blank Space")
song_7 = Song.find_or_create_by_name("Blank Space")
song_6 == song_7
Song.alphabetical

song8 = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
song8.name #=> "Blank Space"
song8.artist_name #=> "Taylor Swift"

song9 = Song.create_from_filename("Nancy Ajram - Ani Alyek.mp3")
song9.name #=> "Anu Alyek"
song9.artist_name #=> "Nancy Ajram"

   def self.alphabetical
 
     @@all.sort_by{|song| song.name}
 
   end

   def self.new_from_filename(filename)
 
     row = filename

       data = row.split(" - ")
       artist_name = data[0]
       song_name = data[1].gsub(".mp3", "")

     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
  end

    



  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
     song.save
     song
  end


