class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = self.new
    s.save
    s
  end

  def self.new_by_name(song_string)
    s = self.new
    s.name = song_string
    s
  end

  def self.create_by_name(song_string)
    s = self.new
    s.name = song_string
    s.save
    s
  end

  def self.all
    @@all
  end

  def self.find_by_name(song_string)
    self.all.detect {|i| i.name == song_string}
  end

  def self.find_or_create_by_name(find_this_song)
    did_i_find_it = self.find_by_name(find_this_song)
      if did_i_find_it == nil
        self.create_by_name(find_this_song)
      else
        did_i_find_it
      end
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 

  def self.new_from_filename(filename)
    #remove .mp3 from string
    f = filename.split(".").first

    #create separate strings for song name and artist_name
    string_parts = f.split(' - ')

    #initialize a song and artist_name from filename
    c = self.new
    c.artist_name = string_parts[0]
    c.name = string_parts[1]
    c
  end

  def self.create_from_filename(filename)
    #remove .mp3 from string
    f = filename.split(".").first

    #create separate strings for song name and artist_name
    string_parts = f.split(' - ')

    #initialize a song and artist_name from filename
    c = self.new
    
    c.artist_name = string_parts[0]
    c.name = string_parts[1]
    c.save
    c
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end


  # def self.find_or_create_by_name("name")
  #   self.all.find{|person| person.name == name}
  # end
  
  # Build a class constructor Song.new_by_name that takes in the string name of a song and returns a song instance with that name set as its name property. Song.new_by_name should return an instance of Song and not a simple string or anything else. 
  