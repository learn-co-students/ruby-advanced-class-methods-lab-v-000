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

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    Song.all.detect do | song_object |
      (song_object.name == name)
    end
  end

  def self.find_or_create_by_name(name)
    found_song = Song.find_by_name(name)

    if found_song == nil
      found_song = Song.create_by_name(name)
    end

    found_song
  end

  def self.alphabetical
     ## declare variables
      cmp = nil
      song_list = Array.new
      sorted_song_list = Array.new
    ## add all song names into a list
      Song.all.each do | song_object |
        song_list << song_object.name
      end
    ## sort the song name list using ruby's sort function
      song_list = song_list.sort
    ## create a new list by linking the song name and the song object
      song_list.each_with_index do | song_name, index |
        ## match the song name to the song object, when the song is linked, remove it from the list
        cmp = Song.all.detect do | song_object |
          song_object.name == song_name
        end

        if cmp != nil
          song_list[index] = "nil"
          sorted_song_list << cmp
        end

      end
      sorted_song_list
  end

  def self.new_from_filename(filename)

    song_data = filename.split(".")
    filename = song_data[0]

    format_data = song_data[1]
    song_data = filename.split("-")

    song_name = song_data[1].split(" ").join(" ")
    artist_name = song_data[0].split(" ").join(" ")

    new_song = Song.new
    new_song.name = song_name
    new_song.artist_name = artist_name

    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = Array.new
  end

end
