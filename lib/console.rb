require 'pry'

def reload!
    load 'lib/song.rb'
end

require_relative './song.rb'

Pry.start
