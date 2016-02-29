class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    #Song.name = name
    #@name = name
    #@@all << name
    song = Song.new
    if Song.all.include?(song)
      @@all << song
      song
    end
  end

  def self.new_by_name(name)
    song = Song.new
  end

  def self.create_by_name(name)
    #@@all << self.new
  end


  def self.find_by_name(name)
    @@all.detect{|song| @@all.song == song}
  end

  def find_or_create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by(&:downcase)
    #also works: self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) #custom constructor
    fields_and_sizes = [[:name, 30], [:artist_name, 30]]
    tag = {}

    open(filename) do |f|
      f.seek(-128, File::SEEK_END)
      if f.read(3) == 'TAG'
        fields_and_sizes.each do |field, size|
          #data = f.read(size).gsub(/\000.*/, "")
          tag[field] = data
          end
        end
      tag
      end
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
