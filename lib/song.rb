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
    new_song = self.new
    @@all << new_song
      #binding.pry
      new_song
    end

    def self.new_by_name(name)
      song = self.new
      song.name = name
      song
    end

    def self.create_by_name(name)
      song = self.new
      song.name = name
      @@all << song
      song
    end

    def self.find_by_name(name)
      @@all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      self.create_by_name(name)
      self.find_by_name(name)
    end

    def self.alphabetical
        @@all.sort { |a, b| a.name <=> b.name }
      end


      def self.new_from_filename(filename)
            #artist_name
            a = filename.split(" - ")
            artist_name = a[0]
            #song_name
            a_one = a[1].split(".")
            name = a_one[0]
            #initializes
            song = self.new
            song.name = name
            song.artist_name = artist_name
            song
            end

            def self.create_from_filename(filename)
              a = filename.split(" - ")
              artist_name = a[0]
              #song_name
              a_one = a[1].split(".")
              name = a_one[0]
              #initializes
              song = self.new
              song.name = name
              song.artist_name = artist_name
              @@all << song
                  song
            end

            def self.destroy_all
              @@all.clear
            end




end
