require 'pry'
class Song
   attr_accessor :name, :artist_name
   @@all = []

   def self.create
      song = new
      @@all.push(song)
      song
   end

   def self.new_by_name(name)
      song = new
      song.name = name
      song
   end

   def self.create_by_name(name)
      song = Song.new_by_name(name)
      song.save
      song
   end

   def self.find_by_name(name)
      all.detect { |song| song.name == name }
   end

   def self.find_or_create_by_name(name)
      Song.find_by_name(name) || Song.create_by_name(name)
   end

   def self.new_from_filename(filename)
      song = Song.create

      song.artist_name = filename.partition(' - ')[0]
      song.name = filename.partition(' - ')[2].chomp('.mp3')

      song
   end

   def self.create_from_filename(filename)
      song = Song.create

      song.artist_name = filename.partition(' - ')[0]
      song.name = filename.partition(' - ')[2].chomp('.mp3')

      song
   end

   def self.all
      @@all
   end

   def save
      self.class.all << self
   end

   def self.alphabetical
      all.sort_by(&:name)
   end

   def self.destroy_all
      all.clear
   end
end

# binding.pry
# binding.pry
