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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
      if result != nil
        result
      else
        self.create_by_name(name)
      end
    end

  def self.alphabetical
    result = []
    final = []
    @@all.each do |word|
      result << word.name
    end
    result.sort!
    result.each do |song|
      final << @@all.detect do |object|
        object.name == song
      end
    end
    final

  end
  def self.new_from_filename(filename)
    result = filename.split(".").delete_at(0).split("-")
    song = self.new
    song.name = result[1].strip
    song.artist_name = result[0].strip
    song
  end

  def self.create_from_filename(filename)
    result = filename.split(".").delete_at(0).split("-")
    song = self.new
    song.name = result[1].strip
    song.artist_name = result[0].strip
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
