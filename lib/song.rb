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
        @@all.detect do |song|
                song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        if find_by_name(name)
            find_by_name(name)
        else
            create_by_name(name)
        end
    end

    def self.alphabetical
        @@all.sort_by{|song| song.name}
    end

    def self.new_from_filename(filename)
        file = filename.split(/[-|.]/)
        song = self.new
        song.name = file[1].strip
        song.artist_name = file[0].strip
        song
    end

    def self.create_from_filename(filename)
        file = filename.split(/[-|.]/)
        song = self.new
        song.name = file[1].strip
        song.artist_name = file[0].strip
        @@all << song
    end

    def self.destroy_all
        self.all.clear
    end

end
