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

  def self.new_by_name(str)
    song = self.new
    song.name = str
    song
  end

  def self.create_by_name(str)
    song = self.new
    song.name = str
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song = self.new
   data = file.split(" - ")
   artist = data[0]
   name = data[1].chomp ".mp3"
   song.name = name
   song.artist_name = artist
   song
 end

 def self.create_from_filename(file)
   song = self.new
   data = file.split(" - ")
   artist = data[0]
   name = data[1].chomp ".mp3"
   song.name = name
   song.artist_name = artist
   song.save
   song
   end

  def self.destroy_all
    self.all.clear
  end

end
#cd labs/ruby-advanced-class-methods-lab-v-000
