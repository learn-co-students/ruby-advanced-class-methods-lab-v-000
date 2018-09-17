require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []



  def self.all
    @@all
  end



  def save
    self.class.all << self
  end


#a class method that .create that instantiates and saves a song and returns the new song created

  def self.create
    song = self.new
     @@all << song
      song
  end


  #Class method new_by_name to instantiate a song with a new property

  def self.new_by_name(name)
    song = self.create
     song.name = (name)
      song

  end


  def self.create_by_name(name)
     song = self.create
       song.name = (name)
         song
  end


  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
      if self.find_by_name(name) != nil
        self.find_by_name(name)

      else
      create_by_name(name)
      end
    end



  def self.alphabetical
       @@all.sort_by do |song|
        song.name
       end
  end


  def self.new_from_filename(filename)
    array = filename.split(" - ")
    song_name = array[1].gsub(".mp3", "")
    name_of_artist = array[0]

    song = self.new
    song.name = song_name
    song.artist_name = name_of_artist

    song
  end


  def self.create_from_filename(filename)
    array = filename.split(" - ")
    new_song_name = array[1].gsub(".mp3", "")
    new_name_of_artist = array[0]


    song = self.create
    song.name = new_song_name
    song.artist_name = new_name_of_artist
     song

   end

   def self.destroy_all
    self.all.clear
  end

 end

      #song = self.new



        # new_artist = artist_name
        #  song = self.new
        #   song.name = new_song
        #
        #     song.artist_name = new_artist
        #
        #       song



















        #binding.pry
