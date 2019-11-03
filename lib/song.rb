require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  class << self
  
    def all
      @@all
    end

    def create
      song = self.new
      @@all << song
      song 
    end

    def new_by_name(song_name)
      song = self.new
      song.name = song_name
      song
    end

    def create_by_name(song_name)
      song = self.create
      song.name = song_name
      song
    end

    def find_by_name(song_name)
      @@all.detect do |song|
        song.name == song_name
      end
    end

    def find_or_create_by_name(song_name)
      find_by_name(song_name) || create_by_name(song_name)
    end

    def alphabetical
      @@all.sort_by(&:name)
    end

    def new_from_filename(file_name)
      artist, song_name = file_name.scan(/(.+) - (.+)\./).flatten
      song = self.new
      song.artist_name = artist
      song.name = song_name
      song
    end

    def create_from_filename(file_name)
      new_song = new_from_filename(file_name)
      new_song.save
      new_song
    end

    def destroy_all
      @@all.clear
    end
  
  end

  def save
    self.class.all << self
  end

end
