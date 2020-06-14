class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song=self.new
    @@all<<song
    song
  end

  def self.new_by_name(name)
    song=self.new
    song.name=name
    #@@all<<song
    song
  end

  def self.create_by_name(name)
    song=self.new
    song.name=name
    @@all<<song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.select{|i| i.name==name}[0]
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song=self.new
    song.artist_name=filename.split(" - ")[0]
    song.name=filename.split(" - ")[1].split(".mp3")[0]
    song
  end

  def self.create_from_filename(filename)
    @@all<<new_from_filename(filename)
  end

 def self.destroy_all
   @@all=[]
 end

end
