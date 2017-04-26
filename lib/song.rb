class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
      song = self.new
      song.name = name
      song.save
      song
   end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end 

  def self.find_by_name(s_name)
      @@all.any? do |song| 
        if s_name == song.name 
          return song
        end
      end
   end  

   def self.find_or_create_by_name(name)
        if self.find_by_name(name) == false
           self.create_by_name(name)
         else 
          self.find_by_name(name)
         end
    end


    def self.alphabetical
       all.sort_by! do |song|
         song.name 
       end
     end

     def self.new_from_filename(filename)
      file1 = filename.split(" - ")
      file2 = file1[1].split(".")
      song = self.new
      song.name = file2[0]
      song.artist_name = file1[0]
      song
    end

    def self.create_from_filename(songmatch)
       song = self.new_from_filename(songmatch)
       song.save
    end

    def self.destroy_all
      @@all.clear
    end


   
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
