class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    create_song = self.new
    @@all << create_song
    create_song
  end

  def self.new_by_name(name)
    create_song = self.new
    create_song.name = name
    @@all << create_song
    create_song
  end

  def self.create_by_name(name)
    create_song = self.new
    create_song.name = name
    @@all << create_song
    create_song.save
    create_song
  end

  def self.find_by_name(name)
    @@all.each do |songs|
      if songs.name == name
        return songs
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    temp_array1 = []
    temp_array2 = []
    @@all.each do |songs|
      temp_array1 << songs.name
    end
    temp_array1 = temp_array1.sort
    temp_array1.each do |names|\
      if !temp_array2.include?(self.find_by_name(names))
        temp_array2 << self.find_by_name(names)
      end
    end
    temp_array2
  end

  def self.new_from_filename(name)
    temp_name = name.scan(/^[a-zA-Z0-9_\s-]+/).join #slightly modded version of regex formula Paul Fox's formula: http://regexlib.com/REDetails.aspx?regexp_id=507
    name_artist_array = temp_name.split(" - ")
    song_name = name_artist_array[1]
    artist_name = name_artist_array[0]
    filename_song = self.new
    filename_song.name = song_name
    filename_song.artist_name = artist_name
    @@all << filename_song
    filename_song
  end

  def self.create_from_filename(name)
    temp_name = name.scan(/^[a-zA-Z0-9_\s-]+/).join #slightly modded version of regex formula Paul Fox's formula: http://regexlib.com/REDetails.aspx?regexp_id=507
    name_artist_array = temp_name.split(" - ")
    song_name = name_artist_array[1]
    artist_name = name_artist_array[0]
    filename_song = self.new
    filename_song.name = song_name
    filename_song.artist_name = artist_name
    @@all << filename_song
    filename_song.save
    filename_song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
