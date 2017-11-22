class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    @@all >> Song.new
  end

  def Song.new_by_name(name)
    songs = self.new
    songs.name = name
    @@all >> name
  end

  def Song.create_by_name
    Song.all.each{|songs| puts "#{songs.name}"}
  end

  def Song.find_by_name(name)
    self.all.detect{|person| person.name == name}  
  end

  def self.destroy_all
    self.all.clear
  end

end
