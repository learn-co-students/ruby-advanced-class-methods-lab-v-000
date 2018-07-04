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

  def self.new_by_name(string_name)
    song = self.new
    song.name = string_name
    song
  end

  def self.create_by_name(string_name)
    song = self.new
    song.name = string_name
    song.save
    song
  end

  def self.find_by_name(string_name)
    self.all.detect {|song| song.name == string_name}
  end

  def self.find_or_create_by_name(string_name)
    song = self.find_by_name(string_name)
    if song == nil
     self.create_by_name(string_name)
    else
     song
    end
  end

   def self.alphabetical
     self.all.sort_by {|x|x.name}
   end

   def self.new_from_filename(filename_format)
     song=self.new
     song.name=filename_format.split(/[^a-zA-Z\s]|\s-\s/)[1]
     song.artist_name=filename_format.split(/[^a-zA-Z\s]|\s-\s/)[0]
     song
   end

   def self.create_from_filename(filename_format)
     song=self.new_from_filename(filename_format)
     song.save
   end

   def self.destroy_all
     self.all.clear
   end

end
