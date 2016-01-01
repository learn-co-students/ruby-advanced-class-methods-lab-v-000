class Song
	attr_accessor :name, :artist_name
	@@all = []

	def self.create
		song = self.new
		@@all << song
		@@all.last
	end

	def self.new_by_name(name)
		song = self.new
		song.name = name
		song
	end

	def self.create_by_name(name)
		song = self.new
		song.name = name
		@@all << song
		song
	end

	def self.find_by_name(name)
		@@all.detect {|a_song| name == a_song.name}
	end

	def self.find_or_create_by_name(name)
		a_object = @@all.detect {|a_song| name == a_song.name}
		if a_object == nil
			a_object = self.new
			a_object.name = name
			@@all << a_object
		end
		a_object
	end

	def self.alphabetical
		@@all.sort {|x, y| x.name <=> y.name}
	end

	def self.new_from_filename(filename)
		split_name = filename.scan(/\b[\w\s]+\b/)
		song = self.new
		song.artist_name = split_name[0]
		song.name = split_name[1]
		song
	end

	def self.create_from_filename(filename)
		split_name = filename.scan(/\b[\w\s]+\b/)
		song = self.new
		song.artist_name = split_name[0]
		song.name = split_name[1]
		@@all << song
		song
	end

	def self.destroy_all 
		@@all.clear
	end

	def self.all
		@@all
	end

	def save
		self.class.all << self
	end
end
