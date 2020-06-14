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



  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end


  def self.find_or_create_by_name(name)
     if self.find_by_name(name) == true
      name
     else
       self.create_by_name(name)
    end
  end


  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end



  def self.new_from_filename(filename)
   song = self.new
   filename.gsub!(".mp3", "")
   song.name = filename.split(" - ")[1]
   song.artist_name = filename.split(" - ")[0]
   song
  end



  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end


  def save
    self.class.all << self
  end


  def self.destroy_all
    self.all.clear
  end
end
