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
    placeholder = self.new
    @@all << placeholder
    return placeholder
  end

  def self.new_by_name(name)
    placeholder = self.new
    placeholder.name = name
    @@all << placeholder
    placeholder
  end

  def self.create_by_name(name)
    placeholder = self.new
    placeholder.name = name
    @@all << placeholder
    placeholder
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil
      song = Song.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(name)
    artistName_Name = filename_parse_helper(name)
    placeholder = self.new
    placeholder.name = artistName_Name[1]
    placeholder.artist_name = artistName_Name[0]
    @@all << placeholder
    placeholder
  end

  def self.create_from_filename(name)
    artistName_Name = filename_parse_helper(name)
    placeholder = self.new
    placeholder.name = artistName_Name[1]
    placeholder.artist_name = artistName_Name[0]
    @@all << placeholder
    placeholder
  end

  def self.destroy_all
    @@all.clear
  end
end

def filename_parse_helper(name)
  return_array = name.split(' - ')
  placeholder = return_array[1].split('.')
  return_array[1] = placeholder[0]
  return_array
end
