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
    @@all.detect{|song| song.name == name}
    # result = nil
    # @@all.each do |song|
    #   result = song if song.name == name
    # end
    # result
  end

  def self.find_or_create_by_name(name)
    search = self.find_by_name(name)

    if !search
      self.create_by_name(name)
    else
      search
    end

  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    noext =  File.basename(filename, ".*").split(" - ")
    song.name = "#{noext[1]}"
    song.artist_name = "#{noext[0]}"
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
