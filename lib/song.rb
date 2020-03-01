class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create
    song= self.new
    song.save
    song
  end

  def self.create_by_name(string_name_of_the_song)
    song= self.new
    song.name = string_name_of_the_song
    song.save
    song
  end

  def self.new_by_name(string_name_of_the_song)    # Unclear what the difference is between new by name and create by name?
    song = self.new
    song.name = string_name_of_the_song
    song.save
    song
  end

  def self.find_by_name(string_name_of_the_song)
    self.all.detect {|i| i.name == string_name_of_the_song}
  end

  def self.find_or_create_by_name(string_name_of_the_song)
    if self.find_by_name(string_name_of_the_song) == nil
      self.create_by_name(string_name_of_the_song)
    else
      self.find_by_name(string_name_of_the_song)
    end
  end

  def self.new_from_filename(filename)
    song = self.new_by_name(filename.split(/[^a-zA-Z\s]|\s-\s/)[1])
    song.artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create_by_name(filename.split(/[^a-zA-Z\s]|\s-\s/)[1])
    song.artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
  end




  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end
end
