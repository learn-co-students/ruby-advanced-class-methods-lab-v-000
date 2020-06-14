class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  song = self.new
  @@all << song
     song
  end

  def self.new_by_name(name)
    song = self.new
  song.name = name
    song
  end

  def self.create_by_name(name)
         song = self.new_by_name(name)
         song.save
         song
       end

       def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

def self.find_or_create_by_name(name)

     if self.find_by_name(name)
       self.find_by_name(name)
     else
       self.create_by_name(name)
     end
   end

def self.alphabetical
  self.all.sort_by{ |song| song.name }
end




def self.new_from_filename(filename)
     data = filename.split('-')
     artist = data[0].strip
     title = data[1].chomp('.mp3').strip
     song = self.new_by_name(title)
     song.artist_name = artist
     song
   end

def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  self.all << song
end

def self.destroy_all
    self.all.clear
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
