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

  def self.new_by_name(song_name)
      song = self.new
      song.name = song_name
      song
  end

  def self.create_by_name(song_name)
      song = self.new_by_name(song_name)
      song.save
      song
  end

  def self.find_by_name(song_name)
      @@all.each do |song|
          if song.name == song_name
             return song
          end
      end
      return nil
  end

  def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
      @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
      return TypeError unless file_name.end_with?(".mp3")
      new_song = file_name.split(/[-.]/)[0..-2].compact.collect{|word| word.strip}
      new_song_name = new_song[1]
      new_song_artist = new_song[0]
      new_instance = self.new
      new_instance.name = new_song_name
      new_instance.artist_name = new_song_artist
      new_instance
  end

  def self.create_from_filename(file_name)
      new_instance = self.new_from_filename(file_name)
      new_instance.save
  end

  def self.destroy_all
      self.all.clear
  end

end
