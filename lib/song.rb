class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new()
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new()
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    @@all.each_with_index do |song, index|
      if name == song.name
        return @@all[index]
      elsif name != song.name
        return false
      end
    end
  end

  # def self.find_or_create_by_name(name)
  #   found_song = self.find_by_name(name)
      
    
  # end


end
