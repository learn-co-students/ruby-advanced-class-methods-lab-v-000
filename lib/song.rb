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
  	song.save
  	song
  end
  
  def self.new_by_name(new_name)
  	song = self.new
  	song.name=new_name
  	song
  end
  
  def self.create_by_name(new_name)
  	song=self.new
  	song.name=new_name
  	song.save
  	song
  end
  
  def self.find_by_name(find)
  	self.all.detect { |x| x.name == find }
  end
  
  def self.find_or_create_by_name(find)
  	if self.all.detect { |x| x.name == find }.nil?
  		song = self.new
  		song.name = find
  		song.save
  		song
  	else
  		self.all.detect { |x| x.name == find }
  	end
  end
  
  def self.alphabetical
  	self.all.sort_by { |x| x.name }
  end
  
  def self.new_from_filename(file)
  	song=self.new
  	song.name=file.scan(/(?<=\-)[\w\s]*(?=\.)/)[0].strip
  	song.artist_name=file.scan(/\A[\w\s]*(?=\-)/)[0].strip
  	song
  end
  
  def self.new_from_filename(file)
  	song=self.new
  	song.name=file.scan(/(?<=\-)[\w\s]*(?=\.)/)[0].strip
  	song.artist_name=file.scan(/\A[\w\s]*(?=\-)/)[0].strip
  	song.save
  	song
  end
  
  def self.destroy_all
  	self.all.clear
  end
  
end







