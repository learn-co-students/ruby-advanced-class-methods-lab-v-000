class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def create(song)
    def initialize
      @@all << self.class.new
    end
  end





  def new_byName(name)
    if @@all.include?(name)
      return name
    end
  end



end
