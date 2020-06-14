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
     new_song = self.new
     @@all << new_song
     new_song
  end
  
  def self.new_by_name(name_string)
    new_song = self.new
    new_song.name = name_string
    new_song
  end
  
  def self.create_by_name(name_string)
    new_song = self.new
    new_song.name = name_string
    new_song.save
    new_song
  end
  
  def self.find_by_name(name_string)
    @@all.detect {|found_song| found_song.name == name_string}
  end
  
  def self.find_or_create_by_name(name_string)
      if self.find_by_name(name_string)
        self.find_by_name(name_string)
      else create_by_name(name_string)
      end
   end
   
   def self.alphabetical 
     @@all.sort_by { |song_object| song_object.name }
   end
   
   def self.new_from_filename(filename)
     split_filename = filename.split(/[-.]/)
     song_object = new_by_name(split_filename[1].strip)
     song_object.artist_name = split_filename[0].strip
     song_object
   end
   
   def self.create_from_filename(filename)
     new_from_filename(filename).save
     
   end
   
   def self.destroy_all 
     @@all = []
   end
   
   
   
end