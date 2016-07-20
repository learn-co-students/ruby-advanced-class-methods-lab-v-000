class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create  #instantiates song instance and stores song in class variable @@all
     song = self.new
     self.all << song
     song
  end

  def self.new_by_name(name) #custom constructor
      song = self.new
      song.name = name
      song
  end

  def self.create_by_name(name)  #custom constructor
      song = self.new
      song.name = name
      @@all << song
      song
  end

  def self.find_by_name(name)   #song finder
      self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil   #if song is not found create it
          self.create_by_name(name)
      else
          self.find_by_name(name)        #if song is found find it
      end
  end

  def self.alphabetical
      #sorts @@all objects by attribute name to alphabetical order
      #@@all.sort! {|a,b| a.name <=> b.name}  methode 1

      self.all.sort! {|a,b| a.name <=> b.name}   #method 2 better
  end

  def self.new_from_filename(songdata)
     data = songdata.split(" - ")
     artist_name = data[0]
     name = data[1].chomp(".mp3")  # takes the .mp3 from end of song title

     song = self.new
     song.name = name
     song.artist_name = artist_name
     song
  end

  def self.create_from_filename(songdata)
      data = songdata.split(" - ")
      artist_name = data[0]
      name = data[1].chomp(".mp3")  # takes the .mp3 from end of song title

      song = self.new
      self.all << song
      song.name = name
      song.artist_name = artist_name
      song
  end

  def self.destroy_all  #clears the @@all array to reinitialize
      self.all.clear
  end


end
