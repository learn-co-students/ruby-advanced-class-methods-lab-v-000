class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song = self.new
    song.name = name
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.find do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
       self.find_by_name(name)
    else
       self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    #split along "-"
    #Taylor Swift - Blank Space.mp3
    file_split = file_name.split(" - ").collect {|x| x.gsub(/.mp3/, '')} # => ["Taylor Swift", "Blank Space"]
    song_instance = self.new_by_name(file_split[1])
    song_instance.artist_name = file_split[0]
    song_instance
    
  end

