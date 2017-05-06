class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  #create method to initialize songs

  def self.create
    new_Song = self.new #creates a new song and saves it to @all
    new_Song.save
    new_Song
  end

  def self.new_by_name(name)
    song = self.new #creates new song
    song.name = name #creates new song with argument name
    song #returns the song with name property
  end

  def self.create_by_name(name)
    song = self.new_by_name(name) #set song to class method
    song.save #saves Song
    song #returns song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name} #finds song names
  end

  def self.find_or_create_by_name(name)
    if self.all.detect{|song|song.name == name} == true
      song #if the song has already been created, return true
    else #create a new song if the song has not been created yet
      song = self.new
      song.name = name
      song
    end
  end

  def self.alphabetical
    return @@all.sort_by {|song| song.name} #sorts a - z
  end

  def self.new_from_filename(file) #creates a new song with name and artist and returns without file format
    song = self.new
    file.chomp!(".mp3")
    songs = file.split(" - ")
    song.name = songs[1]
    song.artist_name = songs[0]
    song
  end


  def self.create_from_filename(file)
    self.new_from_filename(file).save #call on class method to save song with format
  end

  def self.destroy_all
    self.all.clear #removes everything in the class variable @@all
  end
end
