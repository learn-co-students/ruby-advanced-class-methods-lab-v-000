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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name }
 end

 def self.find_or_create_by_name(name)

      if  find_by_name(name)
          find_by_name(name)
      else
        create_by_name(name)
      end
 end

  def self.alphabetical
      self.all.sort_by do |song|
         song.name
       end
  end

  def self.new_from_filename(filename)
      song_Arr =  filename.split(" - ")
      artist_name = song_Arr[0]
      name= song_Arr[1].gsub(".mp3","")
      song = self.new
      song.name = name
      song.artist_name = artist_name
      song
  end

  def self.create_from_filename(filename)
    song_Arr =  filename.split(" - ")
    artist_name = song_Arr[0]
    name= song_Arr[1].gsub(".mp3","")
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
      @@all = []
end





end
