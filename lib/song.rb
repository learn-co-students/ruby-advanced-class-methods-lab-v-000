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
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.each {|x|
      if x.name == title
        return x
      end
      }
  end

  def self.find_or_create_by_name(title)
    self.all.each {|x|
        if x.name == title
          return x
        end
      }
    song = self.new
    song.name = title
    self.all << song
    song
  end

  def self.alphabetical
    array = self.all.sort_by { |song|
      song.name
      }
    array
  end

  def self.new_from_filename(filename)
    song = self.new
    name_array = filename.split(" - ")
    title_array = name_array[1].split(".")
    song.name = title_array[0]
    song.artist_name = name_array[0]
    self.all << song
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    name_array = filename.split(" - ")
    title_array = name_array[1].split(".")
    song.name = title_array[0]
    song.artist_name = name_array[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end


end

