class Song
  attr_accessor :name, :artist_name
  @@all = []

  #def initialize(name)
   # @name = name
  #end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
###############Prewritten above

  def self.create
    song = self.new
    self.all << song
    return song
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    return song
  end


  def self.find_by_name(name)
    self.all.detect{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.all.detect{|song| song.name == name}
    else song = self.new
      song.name = name
      self.all << song
      return song
    end
  end


  def self.destroy_all
    self.all.clear
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end


  def self.new_from_filename(file)
    lst = file.split(" - ")
    artist_name = lst[0]
    name = lst[1]
    name.chomp!(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    return song
  end

    def self.create_from_filename(file)
    lst = file.split(" - ")
    artist_name = lst[0]
    name = lst[1]
    name.chomp!(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
    return song
  end

end
