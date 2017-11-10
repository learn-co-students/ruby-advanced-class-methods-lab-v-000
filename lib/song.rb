class Song
  attr_accessor :name, :artist_name
  @@all = []
  #@name = "" #not necessary, declared inside the filename methods, see newbyname
  #@artist_name = ""
    def self.all
      @@all
    end

    def save
      self.class.all << self
    end

    def self.create #initializes a song instance, saves to @@all, returns the new song instance
      song = Song.new
      song.save
      song
    end

    def self.new_by_name(song_string) #instantiates a song instance
        song = self.new
        song.name = song_string
        #song.artist_name = "" #added inside the filename methods, more efficient but half-assed, instances may exist with undeclared, is that desired?
        song
    end

    def self.create_by_name(song_string)#takes in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @@all class variable.

      song = self.new
      song.name = song_string
      song.artist_name = ""
      song.save
      song

    end

    def self.find_by_name(name)#really low, rspec calls this directly so stupid findorcreate doesn't work
      output = nil
        self.all.each do |song|
          if song.name == name
            output = song
          end
        end
      output
    end

    def self.find_or_create_by_name(name)#either finds or cretates and returns an instance
      if self.find_by_name(name) == nil
        self.create_by_name(name)
      end
      else
        self.find_by_name(name)
      end

    def self.alphabetical #returns all songs in order, user array#sort_by  eq([song_2, song_3, song_1])
      output = [] #eh says to use sortby, it's already an array
      self.all.sort_by{|instance| instance.name }
    end

    def self.new_from_filename(input)#input = "ARTIST - NAME.mp3", call create .name and .artist (.artist doesn't exist yet)
      clean = input.split(" - ")
      clean[1] = clean[1].chomp(".mp3")
      song = self.new
      song.name = clean[1]
      song.artist_name = clean[0]
      #song.save
      song
    end
    def self.filename_clean(input)
      clean = input.split(" - ")
      clean[1] = clean[1].chomp(".mp3") #perfect for file extension, wanted opposite of .slice but found this is even more specific
      song = self.new
      song.name = clean[1]
      song.artist_name = clean[0]
      song.save
      song
    end
    def self.create_from_filename(input) #disregard below, did work as a test.  would need to change the passing other methods to consolidate the parameters (like this), but then each instance would have an empty instead of nonexistent artist_name
      self.filename_clean(input)
      #self
    end
    def self.zcreate_from_filename(input) #what the hell, the same thing (save didn't fail the above).  No idea how to make this more abstract, except add a method to outsource the input cleaning.  can't use the other methods since this adds a new .artist_name.  Better to be explicit rather than half-abstract?
      clean = input.split(" - ")
      clean[1] = clean[1].chomp(".mp3")
      song = self.new
      song.name = clean[1]
      song.artist_name = clean[0]
      song.save
      song
    end

    def self.destroy_all #calls clear on @@all
      #@@all.clear #not the point of this lesson, I think?  no real savings other than the call itself though (I guess the abstraction, can modify .clear later)
      self.all.clear
    end
# a really rotten lab with an unclear lesson and even less clear rspec to follow.  Took about 4 hours (3am 11/10/17), sporadically.







end
