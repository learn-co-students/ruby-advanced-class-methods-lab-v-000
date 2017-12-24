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
    @@all << song
    song
  end

  def self.new_by_name(name)
    #instantiates the song
    song = self.new
    #assigns song.name to the name put in
    song.name = name
    #returns the song
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    #found_song = nil
    #@@all.each do |song|
      #if song.name == name
        #found_song = song
      #end
    #end
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #song = self.find_by_name(name)
    #if song.nil?
      #self.create_by_name(name)
    #end
    if self.find_by_name(name).nil?
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name }
  end

  def self.new_from_filename(filename)
    #song = self.new
    #song.name = name
    #song

    file_info = filename.split(' - ')
    song = self.new
    song.artist_name = file_info[0]
    song.name = file_info[1][/[^.]+/]
    song
  end

  def self.create_from_filename(filename)
    #song = self.create
    #song.name = name
    #song

    file_info = filename.split(' - ')
    song = self.create
    song.artist_name = file_info[0]
    song.name = file_info[1][/[^.]+/]
    song
  end

  def self.destroy_all
    @@all = []
  end
end
