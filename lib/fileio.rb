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

  def message_in
    File.foreach(filepath(@file_in), chomp: true) do |line|
      @message << line
    end
  end

  def message_encrypt
    info = encrypt(message[0])
    @generated_key = info[:key]
    @encrypted_date = info[:date]
    encrypted_done = []
    message.each do |line|
      encrypted_done << encrypt(line, @generated_key)
    end
    @message = encrypted_done
  end
end
