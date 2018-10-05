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
    find_this_song = self.find_by_name
      if find_this_song == nil
        self.create_by_name
      else
        self.find_by_name
      end
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 

  def save
    self.class.all << self
  end

end


  # def self.find_or_create_by_name("name")
  #   self.all.find{|person| person.name == name}
  # end
  
  # Build a class constructor Song.new_by_name that takes in the string name of a song and returns a song instance with that name set as its name property. Song.new_by_name should return an instance of Song and not a simple string or anything else. 
  