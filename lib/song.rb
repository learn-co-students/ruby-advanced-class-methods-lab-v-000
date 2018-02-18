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
    self.all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song_title| song_title.name }
  end

  def self.new_from_filename
    song = self.new
      song_data = all.split(" - ")
        artist_name = song_data[0]
        name = song_data[1].chomp(".mp3")
        song.artist_name = artist_name
        song.name = name
        song
      end


    def self.create_from_filename(all)
      song = self.new
        song_data = all.split(" - ")
          artist_name = song_data[0]
          name = song_data[1].chomp(".mp3")
          song.artist_name = artist_name
          song.name = name
          self.all << song
      end





  def self.destroy_all
    self.all.clear
  end


end
