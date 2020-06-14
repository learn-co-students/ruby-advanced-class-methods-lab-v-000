class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end
  def self.create
    song = self.new
    song.save
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
    song.save
    song
  end
  def self.find_by_name(name)
    @@all.find { |song| name == song.name ? song : false }
  end
  def save
    self.class.all << self
  end
  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end
  def self.alphabetical
    @@all.sort_by { |obj| obj.name }
  end
  def self.new_from_filename(f_name)
    song = self.new
    song.name = f_name.match(/- (.+)\./)[1]
    song.artist_name = f_name.match(/^(.+) -/)[1]
    song
  end
  def self.create_from_filename(f_name)
    song = self.new_from_filename(f_name)
    song.save
  end
  def self.destroy_all
    @@all = []
  end
end
