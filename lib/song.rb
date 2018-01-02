class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    #song.save
    song
  end

  def self.create_by_name(song_name)

    song = Song.new
    song.name = song_name
    song.save
    song

  end

  def self.find_by_name(song_name)

    self.all.detect{|song|song.name == song_name}

  end

  def self.find_or_create_by_name(song_name)

    a = self.find_by_name(song_name)

    if a == nil
      self.create_by_name(song_name)
    else
      a
    end

  end

  def self.alphabetical

    self.all.sort_by{|song|song.name}

  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_from_filename(file_name)
    file_name = file_name.split('-')
    song = Song.new
    song.artist_name = file_name[0].strip()
    song.name = file_name[1].split('.')[0].strip()
    song
  end
  
  def self.create_from_filename(file_name)
    
    file_name = file_name.split('-')
    song = Song.new
    song.artist_name = file_name[0].strip()
    song.name = file_name[1].split('.')[0].strip()
    song.save
    song
    
  end
  
  def self.destroy_all
    self.all.clear
    
  end


end
