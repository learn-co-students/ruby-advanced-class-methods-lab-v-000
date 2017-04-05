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
    #self.all << song #self.class.allㅇ은 아니구만
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name #self.name아님
    song
  end

  def self.create_by_name(name)
    #self.new_by_name을 쓸 수 없나?
    song = self.new
    song.name = name
    self.all << song
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
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    name_with_tag = data[1]
    name = name_with_tag.sub(".mp3","")

    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all #self.를 안쓰면 안되나?
    self.all.clear
  end

end
