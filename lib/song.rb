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
   @@all << self.new
   @@all[@@all.size-1]
 end
 def self.new_by_name(name) # class methods, self refers to the class not the instance
    self.new.tap{|song| song.name = name} # we need to store this to reference as the instance object, think about a variable
    # song.name = name # Song.name = 'Adele'
    # song
  end
  def self.create_by_name(name)
    self.new_by_name(name).tap{|song| song.save}
    # song = self.new_by_name(name)
    # song.save
    # song
  end

  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end
  def self.new_from_filename(name)
    name_array = name.split(" ").uniq.delete_if{|x| x == "-"}
    artist_name = "#{name_array[0]}"
    size = name_array.size
    name_array[size-1] = name_array[size-1].slice(0,name_array[size-1].length-4)
    name = "#{name_array[1, name_array.size].join(" ")}"
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(name)
    self.new_from_filename(name).tap{|song| song.save}
  end
  def self.destroy_all
    @@all = []
  end
end
