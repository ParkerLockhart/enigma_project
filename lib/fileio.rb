require './lib/enigma'

class Fileio < Enigma
  attr_accessor :file_in, :file_out, :key, :date, :message

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @key = ARGV[2]
    @date = ARGV[3]
    @message = []
    @generated_key = nil
    @encrypted_date = nil
  end
end
