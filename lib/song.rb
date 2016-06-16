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
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.alphabetical
    array = @@all

      sorted = false

      while sorted == false
        sorted = true
        index = 0
        holder = 0

        while index < (array.length - 1) do
          if array[index].name > array[index + 1].name
            sorted = false
            holder = array[index]
            array[index] = array[index + 1]
            array[index + 1] = holder
          end
          index += 1
        end
      end
      array
  end

  def self.new_from_filename(filename)
    song = self.new
    array = filename.split(".")
    array = array[0].split(" - ")
    song.artist_name = array[0]
    song.name = array[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    array = filename.split(".")
    array = array[0].split(" - ")
    song.artist_name = array[0]
    song.name = array[1]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
