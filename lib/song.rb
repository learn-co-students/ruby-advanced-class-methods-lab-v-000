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
    s=self.new
    @@all<<s
    return s
  end
  def self.new_by_name(n) s=self.new; s.name=n; s end
  def self.create_by_name(n) s=self.new_by_name(n); @@all<<s; s end
  def self.find_by_name(n) @@all.find { |e| e.name==n} end
  def self.find_or_create_by_name(n) (s=self.find_by_name(n))==nil ?
    self.create_by_name(n) : s end
  def self.alphabetical() @@all.sort_by { |a| a.name} end
  def self.new_from_filename(fn) a=fn.split(" - "); r=self.new_by_name(a[1].chomp(".mp3"))
    r.artist_name=a[0]; r end
  def self.create_from_filename(fn) s=self.new_from_filename(fn); @@all<<s; s end
  def self.destroy_all() @@all=[] end
end
