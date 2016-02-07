require 'pry'
class Song
  @@all = Array.new

  attr_accessor :name, :artist_name

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(new_name)
    song = Song.new
    song.name = new_name
    song
  end

  def self.create_by_name(new_name)
    song = Song.new
    song.name = new_name
    song.save
    song
  end

  def self.find_by_name(target_name)
    #@@all.find { |song| song.name == target_name }
    max = all.count
    i = 0; while i <= max
      if @@all[i].name == target_name
        return @@all[i]
      end
      # i += 1
      i = i + 1
    end
  end

  def self.find_or_create_by_name(target_name)
    if all.empty?
      create_by_name(target_name)
    else
      find_by_name(target_name)
    end
  end

  def self.alphabetical
    all.sort { |x,y| x.name <=> y.name }
  end

  def self.new_from_filename(file)
    file.gsub!(/[.mp3]{4}/, '')
    names = file.split('-')
    song = Song.new
    song.name = names[1].lstrip
    song.artist_name = names[0].rstrip
    song
  end

  def self.create_from_filename(file)
    file.gsub!(/[.mp3]{4}/, '')
    names = file.split('-')
    song = Song.new
    song.name = names[1].lstrip
    song.artist_name = names[0].rstrip
    song.save
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
