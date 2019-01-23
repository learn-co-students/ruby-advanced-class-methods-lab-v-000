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

  end

end #<-----Song class end
