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

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.find {|s| s.name == name} == name
      name
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(file_name)
    s = self.new
    s.artist_name = file_name.split(" - ").first
    s.name = file_name.split(" - ").last.chomp(".mp3")
    s
  end

  def self.create_from_filename(file_name)
    s = self.new
    s.artist_name = file_name.split(" - ").first
    s.name = file_name.split(" - ").last.chomp(".mp3")
    s.save
  end

  def self.destroy_all
    self.all.clear
  end
end
