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
    song=self.new
    song.save
  #  @@all << song
    song
  end
  def self.new_by_name(name)
    song=self.new
    song.name=name
    song
  end
  def self.create_by_name(name)
    song=self.new
    song.name=name
    song.save
    song
  end
  def self.find_by_name(name)
    check=nil
    @@all.each do |song|
      if song.name == name
         check=song
         return check
       end
    end
    check
  end
 def self.find_or_create_by_name(name)
   if self.find_by_name(name)
     song=self.find_by_name(name)
   else
     song=self.create_by_name(name)
   end
  song
 end
 def self.alphabetical
   @@all.sort_by {|song| song.name}
 end
 def self.new_from_filename(string)
   array=string.split(" - ")
   array[1]=array[1].split(".")[0]
   song=self.new
   song.name=array[1]
   song.artist_name=array[0]
   song
 end
 def self.create_from_filename(string)
   song=self.new_from_filename(string)
   song.save
   song
 end
 def self.destroy_all
   @@all.clear
 end
end
