class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    Song.name = name
    @@all << name
  end

  def self.new_by_name(name)
    Song.name = name
  end

  def self.create_by_name(name)
    #@@all << self.new
  end


  def self.find_by_name(name)
    @@all.detect{|song| @@all.song == song}
  end

  def find_or_create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by(&:downcase)
    #also works: self.all.sort_by {|song| song.name}
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
