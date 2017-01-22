class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@name_array = []

  def self.create
    @song = self.new
    @@all << @song
    @song
  end

  def self.new_by_name(songname)
    @song = self.create
    @song.name = songname
    @song.artist_name = @artist_name
    @song
  end

  def self.create_by_name(songname)
    @song = self.new_by_name(songname)
  end

  def self.find_by_name(songname)
    @@all.detect{|song| song.name == songname}
  end

  def self.find_or_create_by_name(songname)
    if self.find_by_name(songname) == nil
      self.create_by_name(songname)
    else
      self.find_by_name(songname)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_array = []
    filename_array = filename.split(" - ")
    @artist_name = filename_array[0]
    name_mp3 = filename_array[1]
    @name = name_mp3.chomp(".mp3")
    @song = new_by_name(@name)
    @song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
