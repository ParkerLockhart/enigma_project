require './lib/scrambler'

class Enigma
  include Tools

  def initialize
  end

  def encrypt(message, key = key_generator, date = Date.today)
    scrambler = Scrambler.new(key, date)
    output = {
      :encryption => scrambler.scramble(message),
      :key => key,
      :date => date_fixer(date).to_s.rjust(6, "0")
    }
  end

  def decrypt(cipher, key, date = Date.today)
    scrambler = Scrambler.new(key, date)
    output = {
      :decryption => scrambler.unscramble(cipher),
      :key => key,
      :date => date_fixer(date).to_s.rjust(6, "0")
    }
  end
end
