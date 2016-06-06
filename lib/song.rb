class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    ans = self.find_by_name(name)
    if ans
      ans
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(fn)
    name = fn.match(/\A(.+)\s-\s(.+)[.]/)
    song = self.new
    song.name = name[2]
    song.artist_name = name[1]
    song
  end

  def self.create_from_filename(fn)
    song = self.new_from_filename(fn)
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end



end


s = Song.create

puts s
puts Song.all

puts Song.all.include?(s)