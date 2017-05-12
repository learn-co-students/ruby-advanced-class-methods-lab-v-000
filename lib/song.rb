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
    new = self.new
    @@all << new
    new
  end

  def self.new_by_name(name)
    new = self.new
    new.name = name
    new
  end

  def self.create_by_name(name)
    new = self.new
    new.name = name
    @@all << new
    new
  end

  def self.find_by_name(name)
    return_value = @@all.collect {|song_instance|   return song_instance if song_instance.name == name}
    return_value
  end

  def self.find_or_create_by_name(input_name)
    name_array = []
    @@all.each { |song|  name_array << song.name}
    if name_array.include?(input_name)
      output_song = ""
      @@all.each { |song| output_song = song if song.name = input_name }
      output_song
    else
      new = self.new
      new.name = input_name
      @@all << new
      new
    end

  end

  def self.alphabetical
    @@all.sort_by { |song|  song.name }
  end

  def self.new_from_filename(file_name)
    file_array = file_name.split(/[-.]/)
    new = self.new
    new.name = file_array[1].strip
    new.artist_name = file_array[0].strip
    new
  end

  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all.clear
  end

end
