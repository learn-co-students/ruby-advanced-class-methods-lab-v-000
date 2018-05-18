class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#constructor
  def self.create
     song = self.new
     self.all << song
     song
  end

#new_by_name
  def self.new_by_name(n)
    song = self.new
    song.name = n
    song
  end

#create_by_name
  def self.create_by_name(n)
    song = self.new
    song.name = n
    self.all << song
    song
  end

#find_by_name
   def self.find_by_name(s)
     @@all.detect {|aux| aux.name == s}
   end

#find_or_create_by_name
def self.find_or_create_by_name(s)
      if self.find_by_name(s) != nil
         self.find_by_name(s)
      else
         self.create_by_name(s)
      end
end
#alphabetical
def self.alphabetical
     @@all.sort_by! {|u| u.name}
end
#create_from_filename
def self.new_from_filename(data)
        aux = data.split(" - ")
        song = self.new
        song.name = aux[1][0..-5]
        song.artist_name = aux[0]
        song
end
#create_from_filename
def self.create_from_filename(data)
      aux = data.split(" - ")
      song = self.new
      song.name = aux[1][0..-5]
      song.artist_name = aux[0]
      self.all << song
      song
end
#destroy_all
def self.destroy_all
      # @@all = [ ]
      self.all.clear
end

end
