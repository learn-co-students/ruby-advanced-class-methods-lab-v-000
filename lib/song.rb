class Song
  attr_accessor :name, :artist_name
  @@all = []

  class << self
    def all
      @@all
    end

    def create
      song = Song.new
      @@all << song
      song
    end

    def new_by_name(name)
      song = Song.new(name)
      @@all << song
      song
    end

    def create_by_name(name)
      song = Song.new(name)
      @@all << song
      song
    end

    def find_by_name(name)
      @@all.detect { |instance| instance.name == name }
    end

    def find_or_create_by_name(name)
      find_by_name(name)
      create_by_name(name)
      find_by_name(name)
    end

    def alphabetical
      @@all.sort_by { |instance| instance.name }
    end

    def new_from_filename(filename)
      array = filename.gsub(".mp3", "").split(" - ")
      var = create_by_name(array[1])
      var.artist_name = array[0]
      var
    end

    def create_from_filename(filename)
      array = filename.gsub(".mp3", "").split(" - ")
      var = create_by_name(array[1])
      var.artist_name = array[0]
      var
    end
    
    def destroy_all
      @@all.clear
    end
  end

  def initialize( name = 'New Song', artist_name = nil)
    @name = name
  end

  def save
    self.class.all << self
  end
end
