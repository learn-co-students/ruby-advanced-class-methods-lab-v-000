class Song
  attr_accessor :name, :artist_name
  @@all = []
 #######################################
  def self.create
    s= new
    s.save
    s
  end
 #######################################
  def self.all
    @@all
  end
  #######################################
  def self.new_by_name(name_of_s)
   s= new
   s.name=name_of_s
   s
  end
  #######################################
  def save
      self.class.all << self
  end
  #######################################
  def self.create_by_name(name_of_s)
   s = new_by_name(name_of_s)
   s.save
   s
 end
  #######################################
  def self.find_by_name(s)
  @@all.find{|x|x.name==s}
end
  #######################################
  def self.find_or_create_by_name(s)
    obj= find_by_name(s)
    obj ? obj : create_by_name(s)
  end

  #######################################
  def self.alphabetical
    @@all.sort_by(& :name)
  ##  @@all.sort! { |a, b|  a.name <=> b.name }
   end
  #######################################
  def self.new_from_filename(mp3_name)
   v=mp3_name.split(/\.|\s-\s/)
   new_o = create
   new_o.name = v[1]
   new_o.artist_name = v[0]
   new_o
  end
  #######################################
  def self.create_from_filename(mp3_name)
     new_from_filename(mp3_name)
  end
  #######################################
  def self.destroy_all
    @@all.clear
  end
  #######################################

end
