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
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    @@all.detect do |song|
    song.name == song_name
    end
  end
    
  # def self.find_or_create_by_name(song_name)
  #   if find_by_name == find_by_name
  #   find_by_name
  #   elsif
  #   create_by_name
  #   end
  # end
  
  def self.alphabetical
    @@all.sort_by { |change| change.name }
  end
  
  def self.destroy_all
    self.all.clear
  end
end

