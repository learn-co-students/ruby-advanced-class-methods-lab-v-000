class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name="Default Song", artist_name="Default Artist")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
    song
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.new_by_name(name)
    self.create(name)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    all_array = self.all
    a = all_array.sort_by {|song| song.name}
    a
  end

  def self.new_from_filename(filename)
    a = []
    file_a = filename.split(" - ")
    file_b = file_a[1].split(".")
    a << file_a[0]
    a << file_b[0]
    self.create(a[1],a[0])
  end

  def self.create_from_filename(filename)
    a = []
    file_a = filename.split(" - ")
    file_b = file_a[1].split(".")
    a << file_a[0]
    a << file_b[0]
    self.create(a[1],a[0])
  end

  def self.destroy_all
    self.all.clear
  end
end