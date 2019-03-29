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
    self.all << song
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
    self.all << song
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.uniq.sort_by{|song| song.name }
  end

  def self.new_from_filename(filename)
    #filename.chomp(".mp3")
    data = filename.split(" - ")
    artist_name = data[0]
    name = data[1].chomp(".mp3")
    song = self.new
    song.artist_name = artist_name
    song.name = name
    song.save
    song
  end

# "Taylor Swift - Blank Space.mp3"
#   csv_data = "Elon Musk, 45, Tesla
# Mark Zuckerberg, 32, Facebook
# Martha Stewart, 74, MSL"
#
#
# rows = csv_data.split("\n")
# people = rows.collect do |row|
#   data = row.split(", ")
#   name = data[0]
#   age = data[1]
#   company = data[2]
#   person = Person.new
#   person.name = name
#   person.age = age
#   person.company = company
#   person
# end
  # def self.create(name)
  #   person = self.new
  #   person.name = name
  #   @@all << person
  # end
end
