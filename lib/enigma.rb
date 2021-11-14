require './lib/scrambler'

class Enigma
  include Scrambler

  def initialize
  end

  def encrypt(message, key = key_generator, date = Date.today)
  output = {
    :encryption => scramble(message, key, date),
    :key => key,
    :date => date.strftime("%m%d%Y")
  }
  end

  def decrypt(cipher, key, date = Date.today)
    output = {
      :decryption => unscramble(cipher, key, date),
      :key => key,
      :date => date
    }
  end
end
