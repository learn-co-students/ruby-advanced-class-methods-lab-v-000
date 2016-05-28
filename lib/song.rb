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
    filename_parse = filename.split(" - ")
    song.artist_name = filename_parse[0]
    name_and_type = filename_parse[1]
    name_parse = name_and_type.split("\.")
    song.name = name_parse[0]
  end



  def self.destroy_all
    @@all.clear
  end


end
