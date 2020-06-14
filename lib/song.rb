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
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all <<song
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all <<song
    song
  end
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
       self.find_by_name(song_name)
     else
      self.create_by_name (song_name)
     end
    end

    def self.alphabetical
      @@all.sort_by{|song| song.name}
    end
    def self.new_from_filename(file_name)
      files = file_name.split(' - ')
      song = self.new
      song.artist_name = files[0]
      song.name = files[1].split('.')[0]
      song
    end
    def self.create_from_filename(file_name)
      files = file_name.split(' - ')
      song = self.new
      song.artist_name = files[0]
      song.name = files[1].split('.')[0]
      @@all << song
      song
    end
    def self.destroy_all
      @@all.clear
    end
end
