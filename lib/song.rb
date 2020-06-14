class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
  song = self.new_by_name(name)
  @@all << song
  song
  end
  
  def self.find_by_name(name)
     self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
     found = self.find_by_name(name)
     if(!found)
       self.create_by_name(name)
     else
       found
    end
       
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    filearray = filename.split("-")
    song = self.new
    song.name = filearray[1].split(".")[0].lstrip
    song.artist_name = filearray[0].rstrip
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all.clear
  end

end
