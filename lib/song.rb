class Song
  attr_accessor :name, :artist_name
  @@all = []

  class << self
    def all
      @@all
    end
  
    def save
      self.class.all << self
    end
  
    def create
      song = self.new
      self.all << song
      
      song
    end
    
    def new_by_name(name)
      song = self.new
      song.name = name
      
      song
    end
    
    def create_by_name(name)
      song = self.new
      song.name = name
      self.all << song
    
      song
    end
    
    def find_by_name(name)
      self.all.find { |song| song.name == name }
    end
    
    def find_or_create_by_name(name)
      found = self.find_by_name(name)
      found.nil? ? self.create_by_name(name) : found
    end
    
    def alphabetical
      self.all.sort_by { |song| song.name }
    end
    
    def new_from_filename(filename)
      song = self.new
      song_data = get_data(filename)
      song.name = song_data[1].strip
      song.artist_name = song_data[0].strip
      
      song
    end
    
    def get_data(filename)
      filename.chomp('.mp3').split('-')
    end
    
    def create_from_filename(filename)
      song = new_from_filename(filename)
      all << song
      
      song
    end
    
    def destroy_all
      all.clear
    end
    
    protected :get_data
  end
end