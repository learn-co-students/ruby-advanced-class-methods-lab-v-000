class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    #initializes a song and saves it to the @@all class variable either literally
    #or through class method Song.all(self.all)
    #should return song instance initialized and saved
    song = self.new
    song.save
    song
  end

  def Song.new_by_name(new_name)
    #takes in the string name of a song and returns a song instance with that
    #name set as its name property and the song being saved into the `@@all` class variable.
    song = self.new
    song.name = new_name
    song
  end


  def Song.create_by_name (create_name)
    #takes in the string name of a song and returns a song instance with that
    #name set as its name property and the song being saved into the `@@all` class variable.
    song = self.new
    song.name = create_name
    song.save
    song

  end

  def Song.find_by_name(find_name)
    #accepts the string name of a song and returns the matching instance of
    #the song with that name
    self.all.detect do |x|
      x.name == find_name
    end
  end

  def Song.find_or_create_by_name(name)
    #accept a string name for a song and either return a matching song instance
    #with that name or create a new song with the name and return the song instance.

      if Song.find_by_name(name) == nil
        Song.create_by_name(name)
      else
        Song.find_by_name(name)
      end


  end

  def Song.alphabetical
    #returns all the songs in ascending (a-z) alphabetical order
    self.all.sort_by!{ |x| x.name.downcase }
  end

  def Song.new_from_filename(file)
    mp3 = self.new
    mp3.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    mp3.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    mp3

  end

  def Song.create_from_filename(file)
    mp3 = self.new
    mp3.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    mp3.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    mp3.save
    mp3
  end

  def self.destroy_all
    self.all.clear
  end

end
