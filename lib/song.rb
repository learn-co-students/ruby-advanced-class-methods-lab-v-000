require 'pry'


#remember to call previous methods instead of re-writing similar code. for example
#instead of calling self.new then pushing into array, just call the create method (which includes save)
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
      song.save ## or self.all << song
      song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name  ## don't just use the variable. call the method to expose the variable
    song
  end

  def self.create_by_name(song_name)
    song = self.create #create creates the song and saves it ## or self.new then save
    song.name = song_name  ## don't just use the variable. call the method to expose the variable
    song
  end

  def self.find_by_name(string_name)
    self.all.detect {|song| song.name == string_name}
  end

  def self.find_or_create_by_name(title)
    if find_by_name(title)
      found_song = find_by_name(title)
    else
      create_by_name(title)
    end
  end

=begin
the above code could also be written
self.find_by_name(title) || self.create_by_name(title)


=end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)  #this function makes new song but doesnt save(create)
    #accept one argument
    #seperate string into array by "-"
    #assign array[0] to artist_name
    #remove ".mp3" from array[1]
    #assign array[1] to song_name

    #create a new instance of the song class with .new
    #assign name with name writer (song.name = name)
    #assign song with artist_name writer
    #return song
    #end
    file_parts = file_name.split(" - ")
    artist_name = file_parts[0]
    #rstrip takes last space off of front

    song_array = file_parts[1].split(".")
    name = song_array[0].lstrip
    #lstip returns a copy of string with leading whitespace removed.
    #" Thunderstruck" => "Thunderstruck"
    #the above code could be simplified with gsub, which takes all occurances
    #of a pattern substituted for the second argument.
    #  song_name = parts[1].gsub(".mp3", "")


    song = self.new  #not self.create here since we don't want to save
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    #accept one argument
    #seperate string into array by "-"
    #assign array[0] to artist_name
    #remove ".mp3" from array[1]
    #assign array[1] to song_name

    #create a new instance of the song class with .new
    #assign name with name writer (song.name = name)
    #assign song with artist_name writer
    #save song
    #return song
    #end
    file_parts = file_name.split(" - ")
    artist_name = file_parts[0]

    song_name = file_parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end



end
