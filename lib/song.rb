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
    save_me = self.new
    save_me.save
    save_me
  end
  
  def self.new_by_name(song_name)
    save_me = self.new
    save_me.name = song_name
    save_me.save
    save_me
  end
  
  def self.create_by_name(song_name)
    created_song = self.new_by_name(song_name)
  end
  
  def self.find_by_name(song_name)
    return_me = nil
    @@all.each do |song_class|
      if song_class.name == song_name
        return_me = song_class
      end
    end
    return_me
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name)? self.find_by_name(song_name) : self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by {|unsorted| unsorted.name}
  end
  
  def self.new_from_filename(song_and_artist_name)
    new_song_from_file = self.new
    new_song_from_file.artist_name = song_and_artist_name.split(/\s-\s/)[0]
    new_song_from_file.name = song_and_artist_name.split(/[^a-zA-Z\s]|\s-\s/)[1]
    new_song_from_file.save
    new_song_from_file
  end
  
  def self.create_from_filename(song_and_artist_name)
    self.new_from_filename(song_and_artist_name)
  end
  
  def self.destroy_all
    @@all.clear #empties the array
  end
  
end
