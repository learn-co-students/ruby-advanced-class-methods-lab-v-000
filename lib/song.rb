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
    newsong = self.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong = self.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = self.create
    newsong.name = name
    newsong
  end

  def self.find_by_name(name)
    self.all.detect { |songs| songs.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    newarray = []
    newarray2 = []
    newarray3 = []
    newarray = self.all.map {|songs| songs.name }
    newarray2 = newarray.sort
    newarray2.each do |newarraysong|
      newarray3 << self.find_by_name(newarraysong)
    end
    newarray3
  end

  def self.new_from_filename(filename)
    newfilename = filename.chomp(".mp3")
    newarray = []
    newarray = newfilename.split(" - ")

    newsong = self.new
    newsong.name = newarray[1]
    newsong.artist_name = newarray[0]
    newsong
  end

  def self.create_from_filename(filename)
    newfilename = filename.chomp(".mp3")
    newarray = []
    newarray = newfilename.split(" - ")

    newsong = self.create
    newsong.name = newarray[1]
    newsong.artist_name = newarray[0]
    newsong
  end

  def self.destroy_all
    self.all.clear
    self.all
  end

end
