class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    obj = Song.new
    @@all << obj
    return obj
  end

  def self.new_by_name(name)
    obj = Song.new
    obj.name = name
    return obj
  end

  def self.create_by_name(name)
    obj = Song.new
    obj.name = name
    @@all << obj
    return obj
  end

  def self.find_by_name(name)
    @@all.detect { |o| o.name == name }
  end

  def self.find_or_create_by_name(name)
    object = self.find_by_name(name)
    if(object.is_a? Song)
      return object
    end
    self.create_by_name(name)
  end

  def self.alphabetical
    return @@all.sort_by {|o| o.name}
  end

  def self.new_from_filename(name)
    name = name.chomp(".mp3")
    name = name.split(" - ")
    obj = Song.new
    obj.name = name[1]
    obj.artist_name = name[0]
    return obj
  end

  def self.create_from_filename(name)
    name = name.chomp(".mp3")
    name = name.split(" - ")
    obj = Song.new
    obj.name = name[1]
    obj.artist_name = name[0]
    @@all << obj
    return obj
  end

  def self.destroy_all
    @@all.clear
  end

end
