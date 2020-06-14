class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.new.tap{|song| song.save}
  end

  def self.new_by_name(name)
    self.new.tap{|song| song.name = name}
  end

  def self.create_by_name(name)
    self.new_by_name(name).tap{|song| song.save}
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    artist, song_name = file.gsub('.mp3', '').split(' - ')
    self.new_by_name(song_name).tap{|song| song.artist_name = artist}
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap{|song| song.save}
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
