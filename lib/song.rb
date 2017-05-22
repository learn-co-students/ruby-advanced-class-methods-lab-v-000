class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    created = new
    created.save
    created
  end

  def self.new_by_name(input)
    named = new
    named.name = input
    named
  end

  def self.create_by_name(input)
    created_named = new
    created_named.name = input
    created_named.save
    created_named
  end

  def self.find_by_name(input)
    @@all.detect { |song| song.name == input }
  end

  def self.find_or_create_by_name(input)
    find_by_name(input) || create_by_name(input)
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(input)
    from_filename = new
    filename_parse = input.match(/(.*)\s\u{002d}\s(.*)\p{Punct}/)
    from_filename.name = filename_parse[2]
    from_filename.artist_name = filename_parse[1]
    from_filename
  end

  def self.create_from_filename(input)
    created_filename = new_from_filename(input)
    created_filename.save
    created_filename
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end
end
