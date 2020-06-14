class Song

  attr_accessor :name, :artist_name
  @@all = []

  def name
    @name
  end

	def artist_name
		@artist_name
	end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

# ****
# can I use this save method with the create_by_name
#  type methods below? what does self.class.all really do?
# ****
# Song.create - class constructor
# initializes song & saves it to @@all
# either literally or via Song.all class method
  def self.create
    song = self.new
    self.all << song
    song
  end

# Song.new_by_name - class constructor
# takes in string name of song
# returns a song instance with that name as its name property
# returns instance of Song, NOT a simple string or anything else.
def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

# Song.create_by_name  - class constructor
# takes in string name of song
# returns song instance with that name as name property
# song is saved into the @@all class variable.
def self.create_by_name(name)
  song = self.new
	song.name = name
	self.all << song
	song
end

# Class finder
# accepts string name of song
# returns matching instance of song with that name
# Song.find_by_name("Just The Way You Are")).to be_falsey
# song_1 = Song.create_by_name("Blank Space")
# song_2 = Song.create_by_name("Hello")
# song_3 = Song.create_by_name("Hotline Bling")
  def self.find_by_name(name)
		self.all.find {|song| song.name == name}
	end

# prevent creation of duplicate songs
# accept string name for song
# return either matching song instance with that name
# or create new song with the name and return song instance.
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

# class method returns all songs
# in ascending (a-z) alphabetical order.
# Use Array#sort_by.
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

# return a new Song instance with song name & artist_name set e.g.:
# Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# song.name #=> "Blank Space"
# song.artist_name #=> "Taylor Swift"
    def self.new_from_filename(filename)
		#split filename arg into artist_name & name
		# split returns new array named s,
		# s[0] is artist, s[1] is song name
			s = filename.split(/ - |.mp3/)
			p s # output s array to check correct format
			song = self.new
		  song.name = s[1]
			song.artist_name = s[0]
			song
	    end

# accepts filename in format
# "Taylor Swift - Blank Space.mp3"
# parse filename correctly & save Song instance
# self.create_from_filename
	def self.create_from_filename(filename)
		song = self.new_from_filename(filename)
		p @@all
		self.all << song
	end

# class method reset state of @@all
# to empty array, deleting all previous song instances.
    def self.destroy_all
      self.all.clear
    end
# class end below
end
Song.create_from_filename("Thundercat - For Love I Come.mp3")
Song.create_by_name("Blank Space")
Song.create_by_name("Hello")
Song.create_by_name("Hotline Bling")
Song.create_by_name("Thriller")
Song.create_by_name("Blank Space")
Song.create_by_name("Call Me Maybe")
Song.find_or_create_by_name("Sometimes")
Song.find_or_create_by_name("Sometimes")
