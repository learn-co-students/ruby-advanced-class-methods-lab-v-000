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
   return song
  end

  def self.create_by_name(name)
   song = self.new
   song.name = name
   @@all << song
   return song
  end

  def self.find_by_name(name)
   Song.all.detect {|song| song.name == "#{name}"}
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      return song
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|word| word.name}
  end

  mp3 = "Taylor Swift - Blank Space.mp3"

  def self.new_from_filename(mp3)
    print array = mp3.split(/[-.]/).map(&:strip)
    array.pop
    song = self.new
    song.name = array[1]
    song.artist_name = array[0]
    return song
  end

  def self.create_from_filename(mp3)
     song = self.new_from_filename(mp3)
     song.save
   end

  def self.destroy_all
    @@all.clear
  end
end
