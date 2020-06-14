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

     def self.new_by_name(name)
       song = self.create
       song.name = name
       song
     end

     def self.create_by_name(name)
       song = self.new_by_name(name)
       song
     end

     def self.find_by_name(name)
       @@all.find{|song| song.name == name}
     end

    def self.find_or_create_by_name(name)
       song = self.create_by_name(name) unless self.find_by_name(name)
       self.find_by_name(name)
     end

     def self.alphabetical
       alphabetized_songs = @@all.sort_by{|song| song.name}
     end

     def self.new_from_filename(filename)
       split_filename = filename.split(" - ")
       song = self.find_or_create_by_name(split_filename[1].chomp(".mp3"))
       song.artist_name = split_filename[0]
       song
     end

     def self.create_from_filename(filename)
       song = self.new_from_filename(filename)
       song.save
       song
     end

     def self.destroy_all
       @@all.clear
     end

end
