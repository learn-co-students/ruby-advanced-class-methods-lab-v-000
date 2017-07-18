class Song
  attr_accessor :name, :artist_name
  @@all = []



  def self.create
      new = self.new
      self.all << new
      new
    end

    def self.new_by_name(name)
    ins= self.new
    self.all << new
    ins.name=name
    ins
  end
  def self.create_by_name(name)
    song=self.create
     song.name=name
     song
  end

  def self.find_by_name(name)
    song= self.all.detect { |e| e.name==name  }
    song
 end
 def self.find_or_create_by_name(name)
   if (self.find_by_name(name))
     return self.find_by_name(name)
   else
     self.create_by_name(name)
   end
 end

 def self.alphabetical
   order= self.all.sort{ |e,b| e.name<=> b.name }
   order
 end

 def self.new_from_filename(filename)
   song=self.new
    data= filename.split("-")
    artist_name=data[0]
    song.artist_name=artist_name[0..((artist_name.length)-2)]
    broken_name=data[1].split(".")
    name=broken_name[0]
    song.name=name[1..((name.length)-1)]
    song
 end
 def self.create_from_filename(filename)
   data= filename.split("-")
   broken_name=data[1].split(".")
   name=broken_name[0]
   name=name[1..((name.length)-1)]
   song=self.create_by_name(name)
   artist_name=data[0]
   song.artist_name=artist_name[0..((artist_name.length)-2)]
   song
 end
 def  self.destroy_all
   self.all.clear

 end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
