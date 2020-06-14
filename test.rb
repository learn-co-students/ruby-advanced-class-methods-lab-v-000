class Song
  attr_accessor :artist

  def artist=(artist)
    artist.songs << self
    @artist = artist # super (super overrides the attr.accessor THIS IS beyonce.artist )
  end
end


class Artists
  attr_accessor :songs

  def initializes
    @songs = []
  end
end

beyonce = Artist.new_by_name
crazy_in_love = Song.nw
crazy_in_love.artist = beyonce

beyonce.songs
