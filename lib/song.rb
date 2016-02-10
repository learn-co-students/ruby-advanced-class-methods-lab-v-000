class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song=self.new
    @@all<<song
    song
  end

  def self.new_by_name(name)
      person=self.new
      person.name=name
      
      person
  end
 
  def self.create_by_name(name)
      song=self.new
      song.name = name
      @@all << song
      song
  end
  
   def self.find_by_name(name)
    @@all.detect do |song|
      song.name==name
    end
  end

  def self.find_or_create_by_name(name)
     song=self.find_by_name(name)
     if song!=nil
        if song.name==name
          return song
         end
      else
        return self.create_by_name(name)
      end
  end

  def self.new_from_filename(file_string)
    song=self.new
    
    album_array=file_string.split(" - ")
    title=album_array[1].split(".")
    artist=album_array[0]
    song.name=title[0]
    song.artist_name=artist
      
    song
  end
 
  def self.create_from_filename(file_string)

    song=self.new
    
    album_array=file_string.split(" - ")
    title=album_array[1].split(".")
    artist=album_array[0]
    song.name=title[0]
    song.artist_name=artist
      
    @@all<<song
  
  end

  def self.alphabetical
      @@all.sort_by do |a|
        a.name
      end
  end
    
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all=[]
  end



end #end class

 


