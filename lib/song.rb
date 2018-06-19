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
    @@all << song
    song
  end

  def self.new_by_name(string_of_song_name)
    song = self.new
    song.name = string_of_song_name
    @@all << song
    song
  end
  
  def self.create_by_name(string_of_song_name)
    song = self.new
    song.name = string_of_song_name
    @@all << song
  end

  def self.find_by_name(string_of_song_name)
    self.all.detect do |song| 
      song.name == string_of_song_name
    end
  end
  
  def self.find_or_create_by_name(find_this_song)
    did_i_find_it = self.all.detect {|song| song.name == find_this_song}
    if did_i_find_it == nil
      song = self.new 
      song.name = find_this_song
      @@all << song 
      songl
    else
      did_i_find_it
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

end
