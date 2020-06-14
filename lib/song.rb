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
    song_instance = self.new
    song_instance.save
    song_instance
  end

  def self.new_by_name(song_name)
    name_instance = self.new
    name_instance.name = song_name
    name_instance
  end

  def self.create_by_name(song_name)
    name_instance = self.new
    name_instance.name = song_name
    name_instance.save
    name_instance
  end

  def self.find_by_name(song_name)
    @@all.each do |object|
      if object.name == song_name
        return object
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(full_song_name)
    song_string = full_song_name[/^[^\.]+/]
    song_array = song_string.split(" - ")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(full_song_name)
    song_string = full_song_name[/^[^\.]+/]
    song_array = song_string.split(" - ")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
