
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
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name

    song
    end

   def self.create_by_name(name)
      song = self.new
      song.name = name
        @@all << song

        song
    end

   def self.find_by_name(name)
     self.all.detect{|song| song.name == name }

    end

     def self.find_or_create_by_name(name)
         a = self.all.detect{|song| song.name == name }
         b = song = self.new
         song.name = name
           @@all << song

        a ||= b

        end

  def self.alphabetical
    self.all.sort_by! {|song| song.name}

      end

    def self.new_from_filename(file_name)

      exp = file_name.split(".")
      file = exp.reject{|x| x=="mp3"}
      yex = file.join(" ").split(" - ")

          name = yex[1]
          artist_name = yex[0]

          song = self.new
          song.artist_name = artist_name
          song.name = name

          song
        end


   def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
         song.save

   end

   def self.destroy_all
    self.all.clear
  end

end
