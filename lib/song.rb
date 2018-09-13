class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name
    @name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end


  # def self.find_by_name(name)
  #   self.all.find{|person| person.name == name}
  # end
  