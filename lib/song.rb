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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
      @@all.each do |song|
        if song.name == name then return song end
      end
      nil
  end

  def self.find_or_create_by_name(name)
    if (self.find_by_name(name)) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    sorted = @@all.sort{|a,b|
      if [b.name, a.name].sort == [b.name, a.name] then 1 else -1 end
    }
    sorted
  end

  def self.new_from_filename(file)
    name = file.match(/-[\w\s]+/).to_s.slice(1..-1).strip
    artist_name = file.match(/[\w\s]+/).to_s.strip
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
