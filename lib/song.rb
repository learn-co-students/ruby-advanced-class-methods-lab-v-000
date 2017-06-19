class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new
    save    
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << name
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.detect{|song| song.name == name}
      song
    else
      self.create_by_name
    end
  end
end
