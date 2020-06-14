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

  def self.new_by_name(new_song)
    song = self.new
    song.name = new_song
    song.save
    song
  end

  def self.create_by_name(name_of_song)
    song_name = self.new
    song_name.name = name_of_song
    song_name.save
    song_name
  end

  def self.find_by_name(song_submited)
    self.all.detect{|p| p.name == song_submited}
  end
  def self.find_or_create_by_name(new_song)
    song_detector = self.all.detect{|p| p.name == new_song}
    if song_detector == nil
      song_name = self.new
      song_name.name = new_song
      song_name.save
      song_name
    else
      song_detector
    end
  end

  def self.alphabetical
    self.all.sort_by {|name_alph| name_alph.name}
  end

  def self.new_from_filename(csv_data)
    file_format = csv_data.split(/[^a-zA-Z\s]|\s-\s/)
    song = self.new
    song.name = file_format[1]
    song.artist_name = file_format[0]
    song
  end

  def self.create_from_filename(csv_data_new)
    file_format = csv_data_new.split(/[^a-zA-Z\s]|\s-\s/)
    song = self.new
    song.name = file_format[1]
    song.artist_name = file_format[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
