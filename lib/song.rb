class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create(name, artist_name)
    song = self.new
    song.name = name
    @@all << person
  end

  def self.new_by_name(name)
  end

  def self.create_by_name(name)

  end

  def self.find_by_name(name)
    @@all.detect{|song| @@all.song == song}
  end

  def find_or_create_by_name(name)
  end

  def alphabetical
    @@all.sort_by {|song| }
  end

  def self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
