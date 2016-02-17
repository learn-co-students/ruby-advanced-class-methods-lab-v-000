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
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.collect { |i| return i if i.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == name ? name : self.create_by_name(name)
  end

  def self.alphabetical
    alpha_arr_of_obj = []
    arr = self.all.collect { |i| i.name}.sort_by {|s| s.downcase}
    arr.each {|i| alpha_arr_of_obj << self.find_by_name(i)}
    alpha_arr_of_obj
  end

  def self.new_from_filename(file)
    file = file.split(" - ").join(".")
    file = file.split(".")
    name = file[1].to_s
    artist_name = file[0].to_s
    new_song = self.find_or_create_by_name(name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file)
    file = file.split(" - ").join(".")
    file = file.split(".")
    name = file[1].to_s
    artist_name = file[0].to_s
    new_song = self.find_or_create_by_name(name)
    new_song.artist_name = artist_name
    @@all << new_song
  end

  def self.destroy_all
     @@all.clear
  end

end
