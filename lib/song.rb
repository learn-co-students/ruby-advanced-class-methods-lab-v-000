class Song
      attr_accessor :name, :artist_name
      @@all = []

  def self.create
        s = self.new
        s.name
        s.artist_name
        if !@@all.include?(s)
             s.save
        end
        s
  end

  def self.new_by_name(n)
       song = self.new
       song.name = n
       song
  end

  def self.create_by_name(name)
        song = self.new
        song.name = name
        @@all << song
        song
  end

  def self.find_by_name(name)
        @@all.detect do |song|
            song.name == name
        end
  end

  def self.find_or_create_by_name(name)
         if Song.find_by_name(name)
               Song.find_by_name(name)
        else
               Song.create_by_name(name)
      end
  end


  def self.alphabetical
        @@all.sort_by{ |song| song.name }
  end


  def self.new_from_filename(file_name)
        rm_of = file_name.rpartition('.').first
        final = rm_of.split(" - ")
        song = self.new
        song.artist_name = final[0]
        song.name = final[1]
        song
  end


  def self.create_from_filename(file_name)
        Song.new_from_filename(file_name).save
  end


  def self.destroy_all
        @@all.clear
  end


  def self.all
        @@all
  end


  def save
        self.class.all << self
  end

end
