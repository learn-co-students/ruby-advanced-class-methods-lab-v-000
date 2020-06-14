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

  def self.new_by_name(song_name)
    new_song_1 = self.new
    new_song_1.name = song_name
    new_song_1
  end

  def self.create_by_name(song_name)
    new_song_2 = self.new
    new_song_2.name = song_name
    new_song_2 = self.new_by_name(song_name)
    new_song_2.save
    new_song_2
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
     song.name == song_name
    end
  end

   def self.find_or_create_by_name(song_name)
     if self.find_by_name(song_name)
       self.find_by_name(song_name)
     else
       self.create_by_name(song_name)
     end
   end

   def self.alphabetical
     @@all.sort_by {|song| song.name}
   end

   def self.new_from_filename(file_name)

     song_data = file_name.split(/ - /)
        artist_name = song_data[0]
        song_name = song_data[1].split(/.mp3/).first
      song = self.new_by_name(song_name)
      song.artist_name = artist_name

      song
    end

    def self.create_from_filename(file_name)

      song_data = file_name.split(/ - /)
         artist_name = song_data[0]
         song_name = song_data[1].split(/.mp3/).first
       song = self.new_by_name(song_name)
       song.artist_name = artist_name
       song.save
       song
     end

     def self.destroy_all
       @@all.clear
     end
   end
