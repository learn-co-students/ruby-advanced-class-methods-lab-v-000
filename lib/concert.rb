require 'pry'

class Concert
  attr_accessor :name

  def initialize(name)

  end
end

concert = Concert.new("test")
binding.pry
