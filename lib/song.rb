class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.destroy_all
    @@all.clear
  end

  def self.create_from_filename (title)
    self.new_from_filename (title)
  end

  def self.new_from_filename (title)
    self.create
    @song.artist_name = title.split("-")[0].strip!
    @song.name = title.split("-")[1].split(".")[0].strip!
    @song
  end

  def self.alphabetical
    self.all.sort_by{|obj|obj.name}
  end

  def self.find_or_create_by_name (song)
    @song = song
    if self.find_by_name(song) == nil
        song = self.new_by_name (song)
     else
       self.find_by_name(song)
     end
  end

  def self.find_by_name(song)
    self.all.detect{|obj|obj.name == song}
  end

  def self.create_by_name (song)
    self.new_by_name (song)
  end

  def self.new_by_name (song)
    @song = song
    @song = self.new
    @song.name = (song)
    @song.save
    @song
  end

  def self.create
    @song = self.new
    @song.save
    @song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
