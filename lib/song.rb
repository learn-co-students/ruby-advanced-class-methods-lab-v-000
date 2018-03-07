class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @name = name
  #   @@all << self
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title)
    namedsong = self.new
    namedsong.name = title
    namedsong
  end

  def self.create_by_name(title)
    namedsong = self.new
    namedsong.name = title
    self.all << namedsong
    namedsong
  end

  def self.find_by_name(title)
    self.all.detect {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    !self.find_by_name(title) ? self.create_by_name(title) : find_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
      namedsong = self.new
      namedsong.name = filename.split(/( - |\.)/)[2]
      namedsong.artist_name = filename.split(/( - |\.)/)[0]
      namedsong
  end

  def self.create_from_filename(filename)
      namedsong = self.new
      namedsong.name = filename.split(/( - |\.)/)[2]
      namedsong.artist_name = filename.split(/( - |\.)/)[0]
      self.all << namedsong
      namedsong
  end

  def self.destroy_all
    self.all.clear
  end
end
