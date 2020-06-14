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
  self.all << song
  song
end

def self.new_by_name(title)
  song = self.new
  song.name = title
  song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  song.save
  song
end

def self.find_by_name(title)
  self.all.find{|song| song.name == title}
end

def self.find_or_create_by_name(title)
  self.find_by_name(title) || self.create_by_name(title)
  end

def self.alphabetical
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(file)
  song = self.new
  temp = file.split(" - ")
  song.name = temp[1].chomp(".mp3")
  song.artist_name = temp[0]
  song
end

def self.create_from_filename(file)
  song = self.new_from_filename(file)
  self.all << song
  song
end

def self.destroy_all
  self.all.clear
end


end
