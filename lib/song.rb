class Song
  attr_accessor :name, :artist_name
  @@all = []
  @name = ""
  @artist_name = ""
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
        song
    end

    def self.create_by_name(song_string)#takes in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @@all class variable.

      song = self.new
      song.name = song_string
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

    def self.create_from_filename(input)
      clean = input.split(" - ")
      clean[1] = clean[1].chomp(".mp3")
      song = self.new
      song.name = clean[1]
      song.artist_name = clean[0]
      song.save
      song
    end

    def self.destroy_all #calls clear on @@all
      self.all.clear
    end








end
