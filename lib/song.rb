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
    self.all.detect{|song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
  end
end

  def self.new_from_filename(filetype)
    song = self.new
    split_by_filetype = filetype.split(" - ")
    name = split_by_filetype[1].gsub(".mp3","")
    song.name = name
    song.artist_name = split_by_filetype[0]
    song
  end


  def self.create_from_filename(filetype)
    song = self.new_from_filename(filetype)
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end



end
