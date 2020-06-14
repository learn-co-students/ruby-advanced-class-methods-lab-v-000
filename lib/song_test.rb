require 'pry'


  def new_from_filename(filename)
    file = filename.split(" - ")
    artist = file[0]
    song = file[1].slice(0..-5)
    binding.pry

  end

new_from_filename("Artist - SongTitle.mp3")
