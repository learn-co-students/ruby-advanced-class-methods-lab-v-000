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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(new_name)
    s = self.new
    s.name = new_name
    s.save
    s
  end

  def self.create_by_name(the_name)
    s = self.new
    s.name = the_name
    s.save
    s
  end

  def self.find_by_name(the_name)
    self.all.detect {|i| i.name == the_name}
  end

  def self.find_or_create_by_name(the_name)
    self.create_by_name(the_name)
    the_name = self.find_by_name(the_name)
  if the_name == nil
    self.create_by_name(the_name)
  else
    the_name
  end
  end

  def self.alphabetical
     self.all.sort_by { |x| x.name}
  end

  def self.new_from_filename(mp3_file)
  s = self.new
  s.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
  s.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
  s
  end

  def self.create_from_filename(mp3_file)
  s = self.new
  s.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
  s.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
  s.save
  s
end

  def self.destroy_all
    self.all.clear
  end
end
