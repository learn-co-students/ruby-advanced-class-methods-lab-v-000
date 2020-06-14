class Song
  attr_accessor :name, :artist_name
  @@all = [] # CLASS VARIABLE, not accessible directly through an instance

  def self.all # CLASS METHOD, self = the class
    @@all
  end

  def save # INSTANCE METHOD, self = this instance
    self.class.all << self
  end
  
  def self.create # CLASS METHOD, self = the class
    song = self.new
    song.save
    return song
  end
  
  def self.new_by_name(song_name_string)
    song = self.new
    song.name = song_name_string
    song.save
    return song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    return song
  end
  
  def self.find_by_name(song_name_string)
    #found_index = @@all.index{|s| s =~ /#{song_name_string}/}
    #return @@all[found_index]
    #return puts Song.all.index(song_name_string)
    #return Song.all[found_index]
    @@all.detect{|i| i.name == song_name_string } 
  end
  
  def self.find_or_create_by_name(song_name_string)
    if find_by_name(song_name_string) == nil 
      return create_by_name(song_name_string)
    else
      return find_by_name(song_name_string)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|s| s.name }
  end
  
  def self.new_from_filename(file_extension_string)
    #"Arist_Name - song_name.mp3"
    file_array = file_extension_string.split(/[\-,\.]/)
    file_array.map!{|item| item.strip!}
    song = Song.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song.save
    return song
  end
  
  def self.create_from_filename(file_extension_string)
    file_array = file_extension_string.split(/[\-,\.]/)
    file_array.map!{|item| item.strip!}
    song = Song.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song.save
    return song
  end
  
  def self.destroy_all
    @@all = []
  end

end
