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
    song=self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song=self.new
    song.name=name
    song
  end

  def self.create_by_name(name)
    song=self.create
    song.name=name
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file = filename.split(/\s\-\s|\./)
    song=self.new_by_name(file[1])
    song.artist_name=file[0]
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(/\s\-\s|\./)
    song=self.create_by_name(file[1])
    song.artist_name=file[0]
  end

  def self.destroy_all
    self.all.clear
  end
end
