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
  	song = self.new
  	self.all << song
    song
  end

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    @name = song
  end

  def self.create_by_name(new_name)
    song = self.new
    song.name = new_name
    self.all << song
    @name = song
  end

  def self.find_by_name(name)
    song_found = nil
    self.all.index do |song_info|
        if song_info.name.include?(name)
    	     song_found = song_info
        end
    end
    return song_found
  end

  def self.find_or_create_by_name(name)
    name_found = nil
    name_found = self.all.detect {|search_name| search_name == name}
    if name_found == nil
       name_found = self.create_by_name(name)
    end
    return name_found
  end

  def self.alphabetical
    return self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(song_info)
    new_str = song_info.sub(/.mp3/, '') # remove .mp3
    artist = new_str.sub(/ - For Love I Come/, '') # extract artist name
    song_title = new_str.sub(/Thundercat - /, '') # extract song title
    song = self.new
    song.name = song_title
    song.artist_name = artist
    return song
  end

  def self.create_from_filename(song_info)
    new_str = song_info.sub(/.mp3/, '') # remove .mp3
    artist = new_str.sub(/ - For Love I Come/, '') # extract artist name
    song_title = new_str.sub(/Thundercat - /, '') # extract song title
    song = self.new
    song.name = song_title
    song.artist_name = artist
    self.all << song
  end

  def self.destroy_all
  	@@all = []
  end

end
