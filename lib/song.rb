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
      song =self.new
      song.save
      song
    end

    def self.new_by_name(name)
      song=self.new
      song.name = name
      song
    end

    def self.create_by_name(name)
      song=self.create
      song.name = name
      song
    end

    def self.new_from_filename(filename)
        result_array = filename.scan(/(.*) - (.*).mp3/)
        if result_array
          song = self.new
          song.artist_name = result_array[0][0]
          song.name = result_array[0][1]
          return song
        else
          return nil
        end
      end

      def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save if song
        song
      end

      def save
        self.class.all << self
      end

      def self.find_by_name(name)
        return @@all.detect {|song| song.name==name }
      end

      def self.find_or_create_by_name(name)
        result = self.find_by_name(name)
        return result if result
        return self.create_by_name(name)
      end

      def self.alphabetical
        @@all.sort {|i,j| i.name <=> j.name}
      end

    def self.destroy_all
    @@all.clear
  end
end
