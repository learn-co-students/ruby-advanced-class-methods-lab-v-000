
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
    find_by_name[]
  end
  
  def self.find_or_create_by_name(find_this_song)
    did_i_find_it = self.all.detect {|song| song.name == find_this_song}
    if did_i_find_it == nil
      song = self.new 
      song.name = find_this_song
      @@all << song 
      song
    else
      did_i_find_it
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(mp3_formatted_file)
    new_mp3 = self.new
    new_mp3.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    new_mp3.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    new_mp3.save
    new_mp3
  end
  
  def self.create_from_filename(mp3_formatted_file)
    new_mp3 = self.new
    new_mp3.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    new_mp3.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    new_mp3.save
    new_mp3
  end

  def self.create_from_filename(mp3_formatted_file)
    
  
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
