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
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    input = self.find_by_name(name)

    if input == nil
      new_song = self.create_by_name(name)
      new_song
    else
      input
    end

  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song = self.new
    file_split = file.split(" - ")
    song.artist_name = file_split[0]
    song.name = file_split[1].chomp('.mp3')
    song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
