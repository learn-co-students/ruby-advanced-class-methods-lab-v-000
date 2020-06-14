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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name 
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|songs| songs.name == song_name }
  end

  def self.find_or_create_by_name(song_name) 
    song = self.new 
    song.name = song_name 
    if @@all.include?(song)
      song
    else
      self.create_by_name(song_name)
    end
     end

     def self.alphabetical
      @@all.sort_by { |x| x.name} 
    end

    def self.new_from_filename(filename)
      song = self.new
     
     song.artist_name = filename.split(" - ")[0] 
     song.name = filename.split(" - ")[1].sub(/.mp3/, '')
     song
        end

        def self.create_from_filename(filename)
     song = self.new_from_filename(filename)
     song.save
     song
 
   end

   def self.destroy_all
    self.all.clear
  end

end
