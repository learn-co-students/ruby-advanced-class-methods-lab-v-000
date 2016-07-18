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
    @@all<<self.new
    @@all.last
  end

  def self.new_by_name(songname)
    song = self.new
    song.name = songname
     @@all << song
     @@all.last
  end


  def self.create_by_name(songname)
      song = self.new
      song.name = songname
      @@all << song
      @@all.last
  end

  def self.find_by_name(var)
    self.all.detect{|song| song.name == var}
  end


  def self.find_or_create_by_name(songname)
    returnval = nil
    @@all.each do |x|
      if x.name == songname
         returnval = x 
        end
      end
        newsong = self.new
        newsong.name = songname
        @@all<<newsong
        returnval = newsong
        returnval
       end
    

  def self.alphabetical
    newarray = self.all.sort_by {|x| x.name}
    newarray
  end


  def self.new_from_filename(songandartist)
    build = songandartist.split(/\.mp3| - /)
    newsong = self.new
    newsong.artist_name = build[0]
    newsong.name = build[1]
    newsong
  end




  def self.create_from_filename(songandartist)
    build = songandartist.split(/\.mp3| - /)
    newsong = self.new
    newsong.artist_name = build[0]
    newsong.name = build[1]
    @@all<<newsong
  end


  def self.destroy_all
    self.all.clear
  end

end



