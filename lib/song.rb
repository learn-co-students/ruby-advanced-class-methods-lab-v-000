class Song
  attr_accessor :name, :artist_name #song name/artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
###########   SONG.CREATE ###########
  def self.create
  song = self.new
  song.save
  song
end
######################################
############# SONG.NEW_BY_NAME ###############
def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end
##############################################
########### CREATE BY NAME####################
def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
###################################
############ FIND BY NAME #########
  def self.find_by_name(song_name)
    self.all.detect{|song|song.name == song_name} # why will include not work include?
  end
##################################
########### FIND OR CREATE BY NAME #######
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end
###############################################
########## ALPHABETICAL ###################
  def self.alphabetical
    self.all.sort_by {|song|song.name}
    ###############################################
    ########## ALPHABETICAL ###################
  end
  def self.new_from_filename(artist_name_and_song)
     #EX "Taylor Swift - Blank Space.mp3" returns Tswift as artist_name and blank space as song name
     name_song = artist_name_and_song.slice!(0...-4).split(" - ")
     artist_name = name_song[0]
     name = name_song[1]

     song = self.new
     song.name = name
     song.artist_name = artist_name
     song
  end

  def self.create_from_filename(artist_name_and_song)
    name_song = artist_name_and_song.slice!(0...-4).split(" - ")
    artist_name = name_song[0]
    name = name_song[1]

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
