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
    song = self.new #puts a new object into a variable for safekeeping
    song.save #uses the SAVE method to shovel the saved object
    song #implicit return of the object itself
  end

  def self.new_by_name(name)
    @name = name #assigns the passed in name to the NAME instance variable
    song = self.new
    song.name=(name) #makes the object's instance variable NAME accessible
    #song.save <-----lab didn't ask to save it- oops
    song
  end

  def self.create_by_name(name)
    @name = name #assigns the passed in name to the NAME instance variable
    song = self.new
    song.name=(name) #writer to the NAME instance variable
    song.save
    song
  end

  def self.find_by_name(name)
    result = nil # <---Flag / Switch - maintaining state
  #  self.all.each do |n|
  #     if n.name == name
  #      result = n
  #     end
  #   end
    #\/ refactored version
    self.all.each do |n|
      result = n if n.name == name
    end
    result
  end

  def self.find_or_create_by_name(name)
     if self.find_by_name(name) == nil
       self.create_by_name(name)
     else
       self.find_by_name(name)
     end
  end

  def self.alphabetical
  self.all.sort_by {|song| song.name.to_s}
  end

  def self.new_from_filename(filename)
    filename_split = filename.split(/ - |\./)
    artist_name = filename_split[0]
    name = filename_split[1]

    song = Song.new

    @name = name
    @artist_name = artist_name
    song.name=(name)
    song.artist_name=(artist_name)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end #<-----Song class end
