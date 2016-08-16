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
    song_created = self.new
    song_created.save
    song_created
  end

  def self.new_by_name(name)
    by_name = self.new
    by_name.name = name
    by_name
  end

  # extra method to abstract adding creating song
  # and adding artist name
  def self.new_by_artist_name(name,artist_name)
    by_name = self.new_by_name(name)
    by_name.artist_name = artist_name
  end

  def self.create_by_name(name)
    by_name = self.new_by_name(name)
    by_name.save
    by_name
  end

  def self.find_by_name(name)
    self.all.detect { |inst| inst.name == name}
  end

  def self.find_or_create_by_name(name)
    by_name = self.find_by_name(name)
    by_name != nil ? by_name : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    filename = name.split(/[.-]/)
    #.collect {|part| part.strip!}
    #self.new_by_artist_name(filename[1],filename[0])
    by_name = self.new_by_name(filename[1].strip)
    by_name.artist_name = filename[0].strip
    by_name
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.destroy_all
    self.all.clear
  end

  def temp
    #by_name = self.all.detect { |inst| inst.name == name}
    #by_name.name = name
    #by_name
  end
end
