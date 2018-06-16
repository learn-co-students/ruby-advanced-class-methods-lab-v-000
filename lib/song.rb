class Song
  
  @@all = []
  attr_accessor :name, :artist_name
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = self.new
    new_song.save
    return new_song
  end
  
  def self.new_by_name(name)
    song = self.create_by_name(name)
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)  
    end
  end
  
  def self.alphabetical
    self.all.sort_by! {|obj| obj.name}
  end
  
  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    file_array[1] = file_array[1].slice(0,file_array[1].length-4)
    song = self.create_by_name(file_array[1])
    song.artist_name = file_array[0]
  end
  
  def self.create_from_filename(filename)
    file_array = filename.split(" - ")
    file_array[1] = file_array[1].slice(0,file_array[1].length-4)
    song = self.create_by_name(file_array[1])
    song.artist_name = file_array[0]
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
