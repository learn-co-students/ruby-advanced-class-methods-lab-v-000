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
    new_song = self.new
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

  def self.find_by_name(title)
    found = @@all.select {|song| song.name == title}
    found[0]
  end

  def self.find_or_create_by_name(title)

    if self.find_by_name(title) == nil
       self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort do |a, b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(file_name)
    split_file = file_name.split("-")
    formatted_file = split_file.collect do |words|
      words.strip!
    end
    formatted_file[1].chomp!(".mp3")
    new_song = self.new_by_name(formatted_file[1])
    new_song.artist_name = formatted_file[0]
    new_song
  end

  def self.create_from_filename(file_name)
    split_file = file_name.split("-")
    formatted_file = split_file.collect do |words|
      words.strip!
    end
    formatted_file[1].chomp!(".mp3")
    new_song = self.create_by_name(formatted_file[1])
    new_song.artist_name = formatted_file[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end


# Song.create_by_name("Dog")
# Song.create_by_name("Cat")
# puts Song.find_by_name("Dog")
# puts Song.find_by_name("Cat")
# puts Song.find_by_name("Bird")
