class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


#----------------------------------------------- everything above was given


  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)  #getting undefined method 'name' when test tries to compare with .name which means reader/accessor not working???
    new_song = Song.new
    @@all << new_song
    new_song.name = name
  end                            #this method also seems to be working with find_by_name, as changing it makes find fail

  def self.find_by_name(name)
    @@all.find do |song|
      if song.name == name
        return song.name
      end
    end
  end

  def self.new_from_filename(name)

  end

  def self.create_from_filename(name)

  end

  def self.destroy_all

  end

  def self.alphabetical

  end

end


#for _from_filename: pop the last 4 chars (.mp3), split on "- ", << last index (the song name)
