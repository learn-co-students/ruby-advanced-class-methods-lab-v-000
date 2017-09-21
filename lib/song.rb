class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

# code starts here
  def self.create
    @@all << Song.new
    @@all [-1]
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song 
  end

  def self.create_by_name(name)
    @@all << self.new_by_name(name)
    @@all[-1] 
  end

  def self.find_by_name(temp)
      @@all.each do |i|
      return i if i.name===temp
      end
      return nil
  end

def self.find_or_create_by_name(temp)
    if self.find_by_name(temp)==nil
      return self.create_by_name(temp)
    else
      return self.find_by_name(temp)
    end
  end

  def self.alphabetical
    temp=[]
    @@all.each{|i| temp << i.name}
    temp.sort{|a,b| a<=>b}.map{|i| self.find_by_name(i)}
  end

  def self.new_from_filename(file)
    temp = file.split(" - ")
    temp[1]=temp[1].split(".")[0]
    song = self.new
    song.name = temp[1]
    song.artist_name = temp[0]
    song
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
    @@all[-1]
  end

  def self.destroy_all
    @@all.clear
  end

end
