require 'pry'
# binding.pry

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
    new.save
    self.all[-1]
  end

  def scope_title(title)
    self.name = title
    save
  end

  def self.new_by_name(string)
    new.scope_title(string)
    song = self.all.pop
  end

  def self.create_by_name(string)
    new.scope_title(string)
    self.all[-1]
  end

  def title_find(search)
    self.class.all.find { |title|
      return title if title.name == search
    }
  end

  def self.find_by_name(string)
    result = new.title_find(string)
  end

  def self.find_or_create_by_name
  end

  def self.alphabetical
  end

  def self.new_from_filename
  end

  def self.create_from_filename
  end

  def self.destroy_all
  end

end