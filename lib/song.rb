class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create(name)
  end

  def self.new_by_name(name)
  end

  def self.create_by_name(name)
  end

  def find_or_create_by_name(name)
  end

  def alphabetical
    @@all.sort_by {|song| }
  end

  def self.new_from_filename(filename)
  end

  def self.destroy_all
  end

  def save
    self.class.all << self
  end

end
