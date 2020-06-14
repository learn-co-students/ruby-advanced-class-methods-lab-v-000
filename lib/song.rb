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
    song = self.new #remember that class methods have arbitrary private variables too (song)
    song.save       #needs its own separate name; can't declare song = self.new.save. Wow that was hard.
    #binding.pry
    return song
  end

  def self.new_by_name(songname) #arbitrary argument name.
    song = self.new            #creates a new song. self.new; Song.new works too, but.. idk?
    song.name = songname        #sets name of song using name property
    return song                #returns
  end

  def self.create_by_name(songname)
    song = self.new
    song.name = songname
    song.save         #merely invokes the .save method
    return song
  end

  def self.find_by_name(songname)
    self.all.detect{|song| song.name == songname} #self(Person).all(@@all array pointer).detect(method): return first such that item.name == songname (argument)
  end

  def self.find_or_create_by_name(songname)
    if self.all.detect{|song| song.name == songname}
      return song #not songname!
    else
    song = self.new
    song.name = songname #song.name = songname; not song = songname. song is the actual object; song.name sets the object's name property to "songname" (in this case "Blank Space")
  end
    song  #return song object
  end


  def self.alphabetical
    sorted = @@all.sort_by{|song| song.name} #yay stack overflow lol. sort each song using its .name property
    sorted
  end


  def self.destroy_all
    @@all.clear        #self-explanatory
  end

  def self.new_from_filename(filename)
    info = filename.split(/[.-]/) #split and save to file (..variable) on regex exp for "." and "-"
    song = self.new
    song.artist_name = info[0].strip #guess I need strip due to the regex not splitting on whitespace; however, doing so would make things messier and...
    song.name = info[1].strip        #complicate things. I suppose this exposes issues of just using info[index], but.. hmm...
    return song
  end

  def self.create_from_filename(filename) #just references the above function and saves from it. 
    newmp3 = self.new_from_filename(filename)
    newmp3.save
    return newmp3
  end

end
