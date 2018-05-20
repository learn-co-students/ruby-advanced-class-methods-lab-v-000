
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

  def scope_title(title, musician = nil)
    self.name = title
    self.artist_name = musician
    save
  end

  def self.new_by_name(string)
    new.scope_title(string)
    self.all.pop
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
    new.title_find(string)
  end

  def self.find_or_create_by_name(string)
    result = find_by_name(string)
    if result != nil
      result
    else
      create_by_name(string)
    end
  end

  def self.alphabetical
    self.all.sort_by { |music|
      music.name
    }
  end

  def self.new_from_filename(string)
    musician = string.match(/.+\b -/).to_s[0...-2]
    title = string.match(/- .+.mp3/i).to_s[2...-4]
    new.scope_title(title, musician)
    self.all.pop
  end

  def self.create_from_filename
  end

  #def self.destroy_all
  #end

end



# spacing