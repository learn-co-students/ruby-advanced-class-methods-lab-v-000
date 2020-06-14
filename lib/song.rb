require'pry'
class Song
    attr_accessor :name, :artist_name
    @@all = []

    def self.create
        song = self.new
        @@all << song
        song
    end

    def self.new_by_name(name)
        song = self.new
        song.name = name
        song
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.create_by_name(name)
        song = self.create
        song.name = name
        song
    end

    def self.find_or_create_by_name(name)
        if !self.find_by_name(name)
            self.create_by_name(name)
        else
            self.find_by_name(name)
        end
    end

    def save
        self.class.all << self
    end

    def self.alphabetical
        self.all.sort_by { |word|  word.name}
    end

    def self.new_from_filename(file)
        # binding.pry
        song = self.new
        song.name = file.split(/\ - |.mp3/).last
        song.artist_name = file.split(/\ - |.mp3/).first
        song
    end

    def self.create_from_filename(file)
        song = self.create
        song.name = file.split(/\ - |.mp3/).last
        song.artist_name = file.split(/\ - |.mp3/).first
        song
    end

    def self.destroy_all
        self.all.clear
    end
end
