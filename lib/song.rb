require 'pry'

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
     song = self.new # save the new instance Class Song which
    #  create a new lower cases song and store it in the in a variable song
    @@all << song #interazile an instanr of a song not class Song and saving.
    song   # the returns it.
  end

# new means create but does not save
#  Create means create and save a.k.a  shovel something into something else.

    def self.new_by_name(name)
         song = self.new
         song.name = name
#(name=  is the getter) is Method and (name is the reader)
# song is an object
         song
    end

    def self.create_by_name(name)
      song = self.new
       song.name = name
        @@all << song
         song
    end

    def self.find_by_name(name)
        @@all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if song = self.find_by_name(name)
        song
      else song = self.create_by_name(name)
        song
      end
    end

      def self.alphabetical
             # the pipe with x in them, we are  saying call each thing that has  x
             #for the array @@all go for each... array and target the name { |x| x.name}
             @@all.sort_by { |x| x.name}
      end

      def self.new_from_filename(name)

            pieces = name.split(" - ")
            song_name = pieces[1].gsub(".mp3","")
            artist_name = pieces[0]
            #new varible object_song to use later on.
            object_song = self.new #we created a new song here.
            object_song.name = song_name
            object_song.artist_name = artist_name

            object_song
      end

    def self.create_from_filename(name)
          #create a file like new... and save it int hthe end by calling save.
          # call new_from_filename  << name and call save.
          create_file = self.new_from_filename(name)
          create_file.save

    end


    def self.destroy_all
       self.all.clear

    end
end
