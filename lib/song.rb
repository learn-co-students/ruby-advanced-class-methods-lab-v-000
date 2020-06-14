require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    @name = name
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    @name = name
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.detect { |i| i.name == name }
  end

  # def self.find_or_create_by_name(name)
  #   if @@all.any? { |i| i.name == name }
  #     find_by_name(name)
  #   else
  #     create_by_name(name)
  #   end
  # end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    @s = self.new

    def self.parse(full_filename)
      full_filename.split(/[-.]/).collect {|word| word.strip}
    end

    parsed_artistname = parse(filename)[0]
    parsed_name = parse(filename)[1]

    @artist_name = parsed_artistname
    @name = parsed_name

    @s.artist_name = parsed_artistname
    @s.name = parsed_name

    @s
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
    @s.save
  end

  def self.destroy_all
    @@all.clear
  end

end
