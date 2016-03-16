require 'pry'

class Song
  attr_accessor :name, :artist_name
 #   attr_reader :alphabetical

  @@all = []

  def self.all
    @@all
  end

 def self.new_from_filename(song)
            values = song.split(" - ")
            artist = values[0]
            song = values[1].chomp(".mp3")
            
            new_instance = Song.new
            new_instance.artist_name=(artist)
            new_instance.name=(song) 
            
            #self.create_by_name(song) 
            new_instance
        end
  def save
    self.class.all << self
  end

  #code starts here
 def self.create
   create_song = Song.new
   create_song.save
    create_song
 end


    def self.alphabetical
       a = self.all.sort_by { |word|  word.name}
      a
    end
  def self.new_by_name(string)
      result = nil
      @string = string
        new =   self.new
        new.name = @string
        self.all << @string
      new
  end


  def self.create_by_name(string)
     new_instance = Song.new
     new_instance.name = string
     self.all << new_instance
    #return
   new_instance
  end

#<Song:0x00000002d5ca58 @name="Blank Spaces"
#<Song:0x00000002d5ca58 @name="Blank Spaces"+


  def self.find_by_name(name)


        @@all.detect do |a|
        #have @result = song == name
         a.name == name
   end


  #return name if @@all has name
  # #<Song:0x00000001288150 @name="Hello">
  end

  def self.find_or_create_by_name(song)
          result = nil
        if @@all.detect { |a| a.name == song}
                  result = Song.new_by_name(song)
        else
          self.create_by_name(song)

        end
  end

end
