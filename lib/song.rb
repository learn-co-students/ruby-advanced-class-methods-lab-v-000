class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize (name)
    @name = name
    self.class.all << self
  end


  def self.create
    song = self.new(name)
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name (name)
    @name = self.new(name)
  end

  def self.find_by_name(name)
    idx = self.all.index(name)
    self.all[idx]
  end

end
