class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name=name
    song
  end

  def self.create_by_name(name)
    song =self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    song=self.find_by_name(name)
    if !song
      song=self.new_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(mp3_data)
    song = self.new
    song_data= mp3_data.split(" - ")
    song.artist_name= song_data[0]
    song.name= song_data[1][0..-5]
    song
  end

  def self.create_from_filename(mp3_data)
    self.new_from_filename(mp3_data).save
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
