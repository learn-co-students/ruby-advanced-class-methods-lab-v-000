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
      @@all << song
      return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
  end

 def self.find_or_create_by_name(name)
  if self.all.include?(name)
    return song
  else
    song = self.new
    song.name = name
    @@all << song
    return song
  end
end

def self.alphabetical
  self.all.sort_by{|song| song.name}
end

def self.new_from_filename(filename)
x = filename.split(/[.-]/)
song = self.new
song.name = x[1]
song.artist_name = x[0]
return song
end

def self.create_from_filename(filename)
  x = filename.split(/[.-]/)
  song = self.new
  song.name = x[1]
  song.artist_name = x[0]
  @@all << song
  end

  def self.destroy_all
     self.all.clear
   end


end
