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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(user_input)
      new_song = self.new
      new_song.name = user_input
      new_song
  end

  def self.create_by_name(user_input)
    new_song = self.new
    new_song.name = user_input
    new_song.save
    new_song
  end

  def self.find_by_name(user_input)
    self.all.detect do |song| song.name == user_input
    end
  end

  def self.find_or_create_by_name(user_input)
    if self.find_by_name(user_input) == nil
     self.create_by_name(user_input)
   else
     self.find_by_name(user_input)
   end
 end

def self.alphabetical
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(file)
  data = file[/[^.]+/].split(" - ")
  artist = data[0]
  song_title = data[1]
  new_song = self.new
  new_song.name = song_title
  new_song.artist_name = artist
  new_song
end

def self.create_from_filename(file)
  new_song = self.new_from_filename(file)
  new_song.save
  new_song
end

def self.destroy_all
  @@all.clear
end

end
