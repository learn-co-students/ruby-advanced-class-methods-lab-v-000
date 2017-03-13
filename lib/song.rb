class Song
  attr_accessor :name, :artist_name, :song
  @@all = []


  def self.all
    @@all
  end

def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
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
    song.save
    song
  end

  def self.find_by_name(name)
      self.all.detect{|song| song.name == name}
    end


    def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create_by_name(name)
      else
        self.find_by_name(name)
      end
    end

    def self.alphabetical
          self.all.sort_by!{|song_name| song_name.name.downcase}
          return self.all

    end

    def self.new_from_filename(filename)
    arr1 = []
    arr2 = []

    arr1v1 = []
    song = self.new
    arr1 = filename.split("-")
    #puts "#{arr1}"



    arr1.each do |x|
      arr1v1 << x.strip
    end


    song.artist_name = arr1v1[0]
    #puts "#{song.artist_name}"

    arr2 = arr1v1[1]
    #puts "#{arr2}"

    dat3 = arr2.split(".")
   # puts "#{dat3}"

    song.name = dat3[0]

   # puts "#{song.name}"

    #turn into an Array
    #split array from -
    #split array[1] from .
    #array[0] = artist_name
    #array[1] = name

    return song


  end

  def self.create_from_filename(filename)

  song = self.new_from_filename(filename)

  song.save
  return song

end

  def self.destroy_all
    self.all.clear
  end

end
