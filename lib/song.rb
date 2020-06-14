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
  	song = self.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	@@all.detect {|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
    if self.all.include?(name)
       self.find_by_name(name)
    else
       self.create_by_name(name)
    end
  end


  def self.alphabetical
  	@@all.sort_by! {|song| song.name.downcase}
  	@@all
  end


  def self.new_from_filename(filename)
  	data = filename.split(" - ").collect {|x| x.gsub(/.mp3/, '')}
    song = self.new_by_name(data[1])
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
  	song = self.new_from_filename(filename)
  	song.save
  end
  
  def self.destroy_all
  	self.all.clear
  end 

end
