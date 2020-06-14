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
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      song = find_by_name(name)
    else
      song = create_by_name(name)
    end
    song

  end

  def self.alphabetical
    array = []
    array = @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    filename_chomp = filename.chomp(".mp3")
    filename_parse = filename_chomp.split(" - ")
    song.artist_name = filename_parse[0]
    song.name = filename_parse[1]
    song
  end


  def self.create_from_filename(filename)
    song = self.new
    filename_chomp = filename.chomp(".mp3")
    filename_parse = filename_chomp.split(" - ")
    song.artist_name = filename_parse[0]
    song.name = filename_parse[1]
    @@all << song
  end



  def self.destroy_all
    @@all.clear
  end


end
