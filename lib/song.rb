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
    song =self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name= name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name= name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.each do |object|
      if object.name == name
        return object
      end
    end
  end

  def self.find_or_create_by_name(name)
    @@all.each do |object|
      if object.name == name
        return object
      end
    end
    Song.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |obj| obj.name }
  end

  def self.new_from_filename(mp3_data)
    data = mp3_data.split(" - ")
     data1 = data[1]
     data2 = data1.split(".")
     name = data2[0]
     artist = data[0]
     song = self.new
     song.name = name
     song.artist_name = artist
     song
   end

   def self.create_from_filename(mp3_data)
     data = mp3_data.split(" - ")
      data1 = data[1]
      data2 = data1.split(".")
      name = data2[0]
      artist = data[0]
      song = self.new
      song.name = name
      song.artist_name = artist
      song.save
      song
    end

    def self.destroy_all
      @@all.clear
    end






end
