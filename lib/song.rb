class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    new_song = self.new
    new_song.save
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name)
    if new_song == nil
      new_song = self.create_by_name(name)
    end
    new_song
  end

  def self.alphabetical
     @@all.uniq!
     @@all.sort_by!{|song| song.name}
  end

    def self.new_from_filename(filename)
      filename.chomp!(".mp3")
      array = filename.split(" - ")
      new_song = self.new
      new_song.artist_name = array[0]
      new_song.name = array[1]
      new_song
    end

    def self.create_from_filename(filename)
      filename.chomp!(".mp3")
      array = filename.split(" - ")
      new_song = self.new
      new_song.artist_name = array[0]
      new_song.name = array[1]
      new_song.save
    end

    def self.destroy_all
      @@all.clear
    end

end
