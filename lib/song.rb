class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end


  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |obj|
      if obj.name == song_name
        obj
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    if !self.find_by_name(song_name)
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by(&:name)
   end

   def self.new_from_filename(str)
     artist_name, song_name = str.split(' - ')
     song = song_name.gsub('.mp3', '')
     new_song = Song.create
     new_song.name = song
     new_song.artist_name = artist_name
     new_song
    #  song = self.new
    #  song.name = str.match(/(?<=-\s).*?(?=\.mp3)/)
    #  song.artist_name = str.match(/^[\w\-]+/)
   end

   def self.create_from_filename(str)
     artist_name, song_name = str.split(' - ')
     song = song_name.gsub('.mp3', '')
     new_song = Song.create
     new_song.name = song
     new_song.artist_name = artist_name
   end

   def self.destroy_all
     @@all = []
   end

end
