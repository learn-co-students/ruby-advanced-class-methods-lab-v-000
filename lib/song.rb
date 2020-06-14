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
    return self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    exists = self.find_by_name(name)

    unless exists
      song = self.create_by_name(name)
      return song
    end

    exists
  end

  def self.alphabetical
    self.all.sort {|s, t| s.name <=> t.name}
  end

  def self.new_from_filename(file)
    song_data = file.strip.split('-')
    song_title = song_data[1].strip!.chomp!('.mp3')
    #require 'pry'; binding.pry
    song = self.new_by_name(song_title)
    song.artist_name = song_data[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
