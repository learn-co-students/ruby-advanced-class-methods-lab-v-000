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
      newSong=self.new
      self.all<<newSong
      newSong
  end

  def self.new_by_name(name)
      newSong=self.new
      newSong.name=name
      newSong
  end

  def self.create_by_name(name)
      newSong=self.new_by_name(name)
      self.all<<newSong
      newSong
  end

  def self.find_by_name(name)
      self.all.detect{|item| item.name==name}
  end

  def self.alphabetical
      self.all.sort_by{|item| item.name[0]}
  end

  def self.new_from_filename(file)
      #   parsing values
      x=file.split(" - ")
      song=self.new_by_name(x[1].sub(/.mp3/,""))
      song.artist_name=x[0]
      song
  end

  def self.create_from_filename(file)
    #   parsing values
    x=file.split(" - ")
    song=self.create_by_name(x[1].sub(/.mp3/,""))
    song.artist_name=x[0]
    song
  end

  def self.find_or_create_by_name(name)
      #try to find, if found, return instance,else create and return new instance
      if !!self.find_by_name(name)
          self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end

  def self.destroy_all
      self.all.clear
  end

end
