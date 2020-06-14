class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
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
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if
        @@all.include?(name)
        name
      else
        song = self.new
        song.name = name
        @@all << song
        song

    end
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(submit)
    data = submit.chomp!(".mp3").split(" - ")
    song = self.new
    song.name = data[1]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
  self.all.clear
end

end
