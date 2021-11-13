require './lib/scrambler'

class Enigma
  include Scrambler
  attr_reader

  def initialize
  end

  def encrypt(message, key = key_generator, date = Date.today)
  output = {
    :encryption => scramble(message, key, date),
    :key => key,
    :date => date
  }
  end
end
