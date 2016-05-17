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
		x = self.new
		x.save
		x
	end
	
	def self.new_by_name(name)
		x = self.new
		x.name = name
		x
	end
	
	def self.create_by_name(name)
		x = self.new
		x.name = name
		x.save
		x
	end
	
	def self.find_by_name(name)
		self.all.detect do |x|
			x.name == name
		end
	end
	
	def self.find_or_create_by_name(name)
		if self.find_by_name(name)
			self.find_by_name(name)
		else
			self.create_by_name(name)
		end
		#unless self.find_by_name(name)
		#	song = self.create_by_name(name)
		#end
		#song
	end
	
	def self.alphabetical 
		@@all.sort_by {|x| x.name }
	end
	
	def self.new_from_filename(name)
		x = self.new
		y = name.chomp(".mp3")
		array = y.split(" - ")
		x.name = array[1]
		x.artist_name = array[0]
		x
	end
	
	def self.create_from_filename(name)
		x = self.new
		x.save
		y = name.chomp(".mp3")
		array = y.split(" - ")
		x.name = array[1]
		x.artist_name = array[0]
		x
	end	
	
	def self.destroy_all
		self.all.clear
	end
end
